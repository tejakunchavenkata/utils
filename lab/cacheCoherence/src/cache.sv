typedef enum bit [3:0] {
        IDLE,   // IDLE
        DELAY,  // Use to delay for one clk cycle
        C_A,    // Read Addr from Core
        C_RD,   // Core Reads Data from Cache
        C_WD,   // Core Writes Data into Cache
        ADDR,   // ADDR Phase
        DATA,   // DATA Phase
        FV_A,   // Flush Victim Addr
        FV_D,   // Flush Victim Data
        ISLP,   // Invalidating Shared Line
        W_BUS   // Wait For Bus
} cache_state_t;

module cache (input clk, input rst, ahblite_if.slave_p core_ifh, ahblite_if.master_p bus_ifh, snoop_if.master_p snoopm_ifh, snoop_if.slave_p snoops_ifh);

reg [`LINE_SIZE - 1 : 0] [7:0]  data_ram        [`NUM_LINES-1:0];
reg [`TAG_WIDTH - 1 : 0]        tag_ram         [`NUM_LINES-1:0];
line_state_t                    status_ram      [`NUM_LINES-1:0];

cache_state_t CUR_STATE, NXT_STATE;
reg [`ADDR_BUS_WIDTH - 1:0] addr;
opr_t opr;
logic broadcasting;

// Extract tag
function automatic logic [`TAG_WIDTH - 1:0] tag (input reg [`ADDR_BUS_WIDTH - 1:0] myAddr);
        tag = myAddr [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE + `LOG2_NUM_LINES];
endfunction

// Extract line
function automatic logic [`LOG2_NUM_LINES - 1:0] line (input reg [`ADDR_BUS_WIDTH - 1:0] myAddr);
        line = myAddr [`LOG2_LINE_SIZE + `LOG2_NUM_LINES - 1:`LOG2_LINE_SIZE];
endfunction

// Extract offset
function automatic logic [`LOG2_LINE_SIZE - 1:0] offset (input reg [`ADDR_BUS_WIDTH - 1:0] myAddr);
        offset = myAddr [`LOG2_LINE_SIZE - 1:0];
endfunction

// Miss or Hit
function automatic logic miss (input reg [`ADDR_BUS_WIDTH - 1:0] myAddr);
        miss = ( (status_ram [line (myAddr)] === INVALID) || (tag_ram [line (myAddr)] !== tag (myAddr)) );
endfunction

// need_bus => if
//              not (Read Hit -or- Write to Modified or Exclusive line) -or-
//              Slave addr Matches Snoop Addr => wait for some time
function automatic logic need_bus (input reg [`ADDR_BUS_WIDTH - 1:0] myAddr, input opr_t myOpr);
        need_bus = (
                (snoops_ifh.snoop_valid && snoops_ifh.saddr === myAddr) ||
                miss (myAddr) ||
                (myOpr === WRITE && status_ram [line (myAddr)] === SHARED)
        );
endfunction

always @ (posedge clk) if (rst) begin

        core_ifh.hgrant <= '1;
        core_ifh.hready <= '0;
        core_ifh.hrdata <= '0;
        core_ifh.hrsp   <= '0;

        bus_ifh.hreq   <= '0;
        bus_ifh.haddr  <= '0;
        bus_ifh.hwdata <= '0;
        bus_ifh.hwrite <= READ;

        snoopm_ifh.t_type <= NT;
        snoopm_ifh.broadcast <= NB;
        broadcasting <= '0;

        snoops_ifh.sc_state <= INVALID;
        snoops_ifh.sdata <= '0;

        CUR_STATE <= IDLE;
        opr <= READ;
        addr <= '0;

        for (int i=0; i<`NUM_LINES; i++) begin
                status_ram[i] <= INVALID;
        end

end


// Master FSM
always @ (posedge clk) if (!rst) begin

        if (CUR_STATE == IDLE) begin

                if (core_ifh.hreq) begin
                        core_ifh.hready <= '1;
                        NXT_STATE <= C_A;
                        CUR_STATE <= DELAY;
                end

        end else if (CUR_STATE == DELAY) begin

                CUR_STATE <= NXT_STATE;

        end else if (CUR_STATE == C_A) begin

                addr <= core_ifh.haddr;
                opr  <= core_ifh.hwrite;

                if ( (snoops_ifh.snoop_valid && core_ifh.haddr == snoops_ifh.saddr) ||
                        need_bus (core_ifh.haddr, core_ifh.hwrite) ) begin

                        core_ifh.hready <= '0;
                        bus_ifh.hreq <= '1;
                        CUR_STATE <= W_BUS;

                end else if (core_ifh.hwrite) begin
                        CUR_STATE <= C_WD;
                end else begin
                        CUR_STATE <= C_RD;
                end

        end else if (CUR_STATE == C_WD) begin

                data_ram [line (addr)] [offset (addr)] <= core_ifh.hwdata;
                status_ram [line (addr)] <= MODIFIED;
                CUR_STATE <= IDLE;

        end else if (CUR_STATE == C_RD) begin

                core_ifh.hrdata <= data_ram [line (addr)] [offset (addr)];
                CUR_STATE <= IDLE;

        end else if (CUR_STATE == W_BUS) begin

                if (! need_bus (addr, opr)) begin

                        if (opr == WRITE) CUR_STATE <= C_WD; else CUR_STATE <= C_RD;

                end else if (bus_ifh.hready && bus_ifh.hgrant) begin

                        if (miss (addr)) begin

                                // We got a miss and need to Flush Victim
                                if (status_ram [line (addr)] == MODIFIED) begin

                                        // Flush without any Broadcasts
                                        bus_ifh.haddr <= {tag_ram [line (addr)], line (addr)};
                                        bus_ifh.hwrite <= WRITE;
                                        CUR_STATE <= FV_A;

                                        snoopm_ifh.t_type <= opr === WRITE ? F_RB : F_R;

                                end else if (status_ram [line (addr)] == SHARED) begin

                                        // Broadcasting Invalidating Shared line
                                        bus_ifh.haddr <= {tag_ram [line (addr)], line (addr)};
                                        snoopm_ifh.broadcast <= ISL;
                                        broadcasting <= '1;
                                        status_ram [line (addr)] <= INVALID;
                                        CUR_STATE <= ISLP;

                                        snoopm_ifh.t_type <= opr === WRITE ? B_RB : B_R;

                                end else begin

                                        // Exclusive or Invalid or Shared do not need flushing
                                        status_ram [line (addr)] <= INVALID;

                                        bus_ifh.haddr <= {tag (addr), line (addr)};
                                        bus_ifh.hwrite <= READ;
                                        CUR_STATE <= ADDR;

                                        snoopm_ifh.t_type <= opr === WRITE ? RB : R;
                                        broadcasting <= '1;
                                        snoopm_ifh.broadcast <= opr == WRITE ? RTM : RD;

                                end

                        end else begin

                                // Trying to Modify Shared line => Broadcast Invalidate
                                snoopm_ifh.broadcast <= IVDATE;
                                broadcasting <= '1;
                                bus_ifh.haddr <= addr;

                                data_ram [line (addr)] [offset (addr)] <= core_ifh.hwdata;
                                status_ram [line (addr)] <= MODIFIED;
                                CUR_STATE <= IDLE;

                                snoopm_ifh.t_type <= B;

                        end

                end

        end else if (CUR_STATE == FV_A) begin

                bus_ifh.hwdata <= data_ram [line (addr)];
                status_ram [line (addr)] <= INVALID;
                CUR_STATE <= FV_D;

        end else if (CUR_STATE == FV_D || CUR_STATE == ISLP) begin

                if (bus_ifh.hready) begin

                        bus_ifh.haddr <= addr;
                        bus_ifh.hwrite <= READ;
                        CUR_STATE <= ADDR;

                        broadcasting <= '1;
                        snoopm_ifh.broadcast <= opr == WRITE ? RTM : RD;

                end

        end else if (CUR_STATE == ADDR) begin

                CUR_STATE <= DATA;

        end else if (CUR_STATE == DATA) begin

                if (bus_ifh.hready) begin

                        data_ram [line (addr)]   <= bus_ifh.hrdata;
                        status_ram [line (addr)] <= opr === WRITE ? MODIFIED : (snoopm_ifh.other_copies ? SHARED : EXCLUSIVE);
                        tag_ram [line (addr)]    <= tag (addr);
                        CUR_STATE <= IDLE;

                end

        end

end


// Snooper COMBO
always @* if (!rst) begin

        if (miss (snoops_ifh.saddr << `LOG2_LINE_SIZE)) begin
                snoops_ifh.sc_state <= INVALID;
                snoops_ifh.sdata <= '0;
        end else begin
                snoops_ifh.sc_state <= status_ram [line (snoops_ifh.saddr << `LOG2_LINE_SIZE)];
                snoops_ifh.sdata  <= data_ram [line (snoops_ifh.saddr << `LOG2_LINE_SIZE)];
        end

end

// Snooper FSM
always @ (posedge clk) if (!rst && snoops_ifh.snoop_valid && !(miss(snoops_ifh.saddr))) status_ram [line (snoops_ifh.saddr)] <= snoops_ifh.sn_state;

always @ (posedge clk) if (!rst && broadcasting) begin
        broadcasting <= '0;
        snoopm_ifh.broadcast <= NB;
end

endmodule : cache
