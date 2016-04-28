typedef enum bit [3:0] {
        FREE,
        WAIT,
        T_TYPE,
        W_FLUSH_DATA,
        FLUSH_DATA,
        READ_A,
        SYNC_MEM_A,
        SYNC_MEM_D,
        READ_D,
        GET_MEM_A,
        GET_MEM_D
} arb_state_t;

`define SADDR(m, s0, s1, s2, s3) begin  \
s0.saddr <= m.haddr;            \
s1.saddr <= m.haddr;            \
s2.saddr <= m.haddr;            \
s3.saddr <= m.haddr;            \
end

`define CH_STATE(s0, valid0, state0, s1, valid1, state1, s2, valid2, state2, s3, valid3, state3) begin \
        s0.snoop_valid <= valid0; \
        s0.sn_state <= state0; \
        s1.snoop_valid <= valid1; \
        s1.sn_state <= state1; \
        s2.snoop_valid <= valid2; \
        s2.sn_state <= state2; \
        s3.snoop_valid <= valid3; \
        s3.sn_state <= state3; \
end

`define SN_STATE(s0, s1, s2, s3) begin \
        case (s0.broadcast) \
                IVDATE, RTM: `CH_STATE (s0, 0, INVALID, s1, 1, INVALID, s2, 1, INVALID, s3, 1, INVALID) \
                ISL: begin \
                        case ({s1.sc_state==SHARED, s2.sc_state==SHARED, s3.sc_state==SHARED}) \
                                3'b100:  `CH_STATE (s0, 0, INVALID, s1, 1, EXCLUSIVE, s2, 0, INVALID,   s3, 0, INVALID)   \
                                3'b010:  `CH_STATE (s0, 0, INVALID, s1, 0, INVALID,   s2, 0, EXCLUSIVE, s3, 0, INVALID)   \
                                3'b001:  `CH_STATE (s0, 0, INVALID, s1, 0, INVALID,   s2, 0, INVALID,   s3, 0, EXCLUSIVE) \
                                default: `CH_STATE (s0, 0, INVALID, s1, 0, INVALID,   s2, 0, INVALID,   s3, 0, INVALID)   \
                        endcase \
                end \
                RD: `CH_STATE (s0, 1, SHARED, s1, 1, SHARED, s2, 1, SHARED, s3, 1, SHARED) \
                default: `CH_STATE (s0, 0, INVALID, s1, 0, INVALID, s2, 0, INVALID, s3, 0, INVALID) \
        endcase \
end

`define RESET(c, cs) begin      \
        c.hrdata <= '0;         \
        c.hready <= '0;         \
        c.hgrant <= '0;         \
        c.hrsp   <= '0;         \
        cs.other_copies <= '0;  \
        cs.snoop_valid <= '0;   \
        cs.saddr <= '0;         \
        cs.sn_state <= INVALID; \
end

`define OTHER_COPIES(s0, s1, s2, s3) begin \
        s0.other_copies <= ! (s1.sc_state == INVALID && s2.sc_state == INVALID && s3.sc_state == INVALID); \
        s1.other_copies <= '0; \
        s2.other_copies <= '0; \
        s3.other_copies <= '0; \
end

`define GRANT(c0, c1, c2, c3) begin \
        c0.hgrant <= '1; c0.hready <= '1; \
        c1.hgrant <= '0; c1.hready <= '0; \
        c2.hgrant <= '0; c2.hready <= '0; \
        c3.hgrant <= '0; c3.hready <= '0; \
        CUR_STATE <= WAIT; \
        NXT_STATE <= T_TYPE; \
end

`define T_TYPE(c0, cs0, cs1, cs2, cs3) begin \
        case (cs0.t_type) \
                F_RB, F_R: begin \
                        // Flush        -> Read & Broadcast \
                        // Flush        -> Read \
                        if (mem_ifh.hready) begin \
                                mem_ifh.haddr <= c0.haddr; \
                                CUR_STATE <= FLUSH_DATA; \
                        end else begin \
                                c0.hready <= '0; \
                                mem_ifh.hreq <= '1; \
                                CUR_STATE <= W_FLUSH_DATA; \
                        end \
                end \
                B_RB, B_R: begin \
                        // Broadcast    -> Read & Broadcast \
                        // Broadcast    -> Read \
                        CUR_STATE <= READ_A; \
                end \
                RB, R: begin \
                        // Read & Broadcast \
                        // Read \
                        if (cs1.sc_state != INVALID || cs2.sc_state != INVALID || cs3.sc_state != INVALID) begin \
                                c0.hrdata <= cs1.sdata | cs2.sdata | cs3.sdata; \
                                c0.hready <= '1; \
                                if (cs1.sc_state == MODIFIED || cs2.sc_state == MODIFIED || cs3.sc_state == MODIFIED) begin \
                                        addr <= c0.haddr; \
                                        data <= cs1.sdata | cs2.sdata | cs3.sdata; \
                                        mem_ifh.hreq <= '1; \
                                        CUR_STATE <= SYNC_MEM_A; \
                                end else begin \
                                        CUR_STATE <= READ_D; \
                                end \
                        end else begin \
                                mem_ifh.hreq <= '1; \
                                addr <= c0.haddr; \
                                c0.hready <= '0; \
                                CUR_STATE <= GET_MEM_A; \
                        end \
                end \
                B: begin \
                        // Broadcast \
                        CUR_STATE <= FREE; \
                end \
                default: $display ("Unexpected T_TYPE"); \
        endcase \
end

`define READ_A(c0, cs1, cs2, cs3) begin \
        if (cs1.sc_state != INVALID || cs2.sc_state != INVALID || cs3.sc_state != INVALID) begin \
                c0.hrdata <= cs1.sdata | cs2.sdata | cs3.sdata; \
                c0.hready <= '1; \
                if (cs1.sc_state == MODIFIED || cs2.sc_state == MODIFIED || cs3.sc_state == MODIFIED) begin \
                        addr <= c0.haddr; \
                        data <= cs1.sdata | cs2.sdata | cs3.sdata; \
                        mem_ifh.hreq <= '1; \
                        CUR_STATE <= SYNC_MEM_A; \
                end else begin \
                        CUR_STATE <= READ_D; \
                end \
        end else begin \
                c0.hready <= '0; \
                addr <= c0.haddr; \
                mem_ifh.hreq <= '1; \
                CUR_STATE <= GET_MEM_A; \
        end \
end

module arbitor ( input reg clk, rst,
        ahblite_if.slave_p c_if0h, snoop_if.bus_p cs_if0h,
        ahblite_if.slave_p c_if1h, snoop_if.bus_p cs_if1h,
        ahblite_if.slave_p c_if2h, snoop_if.bus_p cs_if2h,
        ahblite_if.slave_p c_if3h, snoop_if.bus_p cs_if3h,
        ahblite_if.master_p mem_ifh
);

reg [1:0] sel, selBuf;
arb_state_t CUR_STATE, NXT_STATE;
reg [`ADDR_BUS_WIDTH - 1:0] addr;
reg [`LINE_SIZE - 1:0][7:0] data;

// Reset
always @ (posedge clk) if (rst) begin
        `RESET (c_if0h, cs_if0h)
        `RESET (c_if1h, cs_if1h)
        `RESET (c_if2h, cs_if2h)
        `RESET (c_if3h, cs_if3h)

        mem_ifh.hreq   <= '0;
        mem_ifh.haddr  <= '0;
        mem_ifh.hwrite <= READ;
        mem_ifh.hwdata <= '0;

        sel <= '1;
        selBuf <= '1;
        CUR_STATE <= FREE;
        NXT_STATE <= FREE;
        addr <= '0;
        data <= '0;
end

// saddr
always @* if (!rst) begin
        case (sel)
                2'd0: `SADDR (c_if0h, cs_if0h, cs_if1h, cs_if2h, cs_if3h)
                2'd1: `SADDR (c_if1h, cs_if1h, cs_if0h, cs_if2h, cs_if3h)
                2'd2: `SADDR (c_if2h, cs_if2h, cs_if0h, cs_if1h, cs_if3h)
                2'd3: `SADDR (c_if3h, cs_if3h, cs_if0h, cs_if1h, cs_if2h)
        endcase
end

// sn_state
always @* if (!rst) begin
        case (sel)
                2'd0: `SN_STATE (cs_if0h, cs_if1h, cs_if2h, cs_if3h)
                2'd1: `SN_STATE (cs_if1h, cs_if0h, cs_if2h, cs_if3h)
                2'd2: `SN_STATE (cs_if2h, cs_if0h, cs_if1h, cs_if3h)
                2'd3: `SN_STATE (cs_if3h, cs_if0h, cs_if1h, cs_if2h)
        endcase
end

// other_copies
always @* if (!rst) begin
        case (sel)
                2'd0: `OTHER_COPIES (cs_if0h, cs_if1h, cs_if2h, cs_if3h)
                2'd1: `OTHER_COPIES (cs_if1h, cs_if0h, cs_if2h, cs_if3h)
                2'd2: `OTHER_COPIES (cs_if2h, cs_if0h, cs_if1h, cs_if3h)
                2'd3: `OTHER_COPIES (cs_if3h, cs_if0h, cs_if1h, cs_if2h)
        endcase
end

always @ (posedge clk) if (!rst) begin
        if (CUR_STATE == FREE) begin

                selBuf = sel;
                for (int i=0; i<4; i++) begin
                        selBuf = selBuf + 1;
                        case (selBuf)
                                2'd0: if (c_if0h.hreq) begin `GRANT (c_if0h, c_if1h, c_if2h, c_if3h); i = 4; end
                                2'd1: if (c_if1h.hreq) begin `GRANT (c_if1h, c_if0h, c_if2h, c_if3h); i = 4; end
                                2'd2: if (c_if2h.hreq) begin `GRANT (c_if2h, c_if0h, c_if1h, c_if3h); i = 4; end
                                2'd3: if (c_if3h.hreq) begin `GRANT (c_if3h, c_if0h, c_if1h, c_if2h); i = 4; end
                        endcase
                end
                sel <= selBuf;

        end else if (CUR_STATE == WAIT) begin

                CUR_STATE <= NXT_STATE;

        end else if (CUR_STATE == T_TYPE) begin

                case (sel)
                        2'd0: `T_TYPE (c_if0h, cs_if0h, cs_if1h, cs_if2h, cs_if3h)
                        2'd1: `T_TYPE (c_if1h, cs_if1h, cs_if0h, cs_if2h, cs_if3h)
                        2'd2: `T_TYPE (c_if2h, cs_if2h, cs_if0h, cs_if1h, cs_if3h)
                        2'd3: `T_TYPE (c_if3h, cs_if3h, cs_if0h, cs_if1h, cs_if2h)
                endcase

        end else if (CUR_STATE == W_FLUSH_DATA) begin

                if (mem_ifh.hready) begin
                        case (sel)
                                2'd0: mem_ifh.haddr <= c_if0h.haddr;
                                2'd1: mem_ifh.haddr <= c_if1h.haddr;
                                2'd2: mem_ifh.haddr <= c_if2h.haddr;
                                2'd3: mem_ifh.haddr <= c_if3h.haddr;
                        endcase
                        mem_ifh.hwrite <= WRITE;
                        CUR_STATE <= FLUSH_DATA;
                end

        end else if (CUR_STATE == FLUSH_DATA) begin

                case (sel)
                        2'd0: begin mem_ifh.hwdata <= c_if0h.hwdata; c_if0h.hready <= '1; end
                        2'd1: begin mem_ifh.hwdata <= c_if1h.hwdata; c_if1h.hready <= '1; end
                        2'd2: begin mem_ifh.hwdata <= c_if2h.hwdata; c_if2h.hready <= '1; end
                        2'd3: begin mem_ifh.hwdata <= c_if3h.hwdata; c_if3h.hready <= '1; end
                endcase
                CUR_STATE <= READ_A;

        end else if (CUR_STATE == READ_A) begin

                case (sel)
                        2'd0: `READ_A (c_if0h, cs_if1h, cs_if2h, cs_if3h)
                        2'd1: `READ_A (c_if1h, cs_if0h, cs_if2h, cs_if3h)
                        2'd2: `READ_A (c_if2h, cs_if0h, cs_if1h, cs_if3h)
                        2'd3: `READ_A (c_if3h, cs_if0h, cs_if1h, cs_if2h)
                endcase

        end else if (CUR_STATE == SYNC_MEM_A) begin

                case (sel)
                        2'd0: begin c_if0h.hgrant <= '0; c_if0h.hready <= '0; end
                        2'd1: begin c_if1h.hgrant <= '0; c_if1h.hready <= '0; end
                        2'd2: begin c_if2h.hgrant <= '0; c_if2h.hready <= '0; end
                        2'd3: begin c_if3h.hgrant <= '0; c_if3h.hready <= '0; end
                endcase
                if (mem_ifh.hready) begin
                        mem_ifh.haddr <= addr;
                        mem_ifh.hwrite <= WRITE;
                        CUR_STATE <= SYNC_MEM_D;
                end

        end else if (CUR_STATE == SYNC_MEM_D) begin

                mem_ifh.hwdata <= data;
                CUR_STATE <= FREE;
                
        end else if (CUR_STATE == READ_D) begin
                
                case (sel)
                        2'd0: begin c_if0h.hgrant <= '0; c_if0h.hready <= '0; end
                        2'd1: begin c_if1h.hgrant <= '0; c_if1h.hready <= '0; end
                        2'd2: begin c_if2h.hgrant <= '0; c_if2h.hready <= '0; end
                        2'd3: begin c_if3h.hgrant <= '0; c_if3h.hready <= '0; end
                endcase
                CUR_STATE <= FREE;

        end else if (CUR_STATE == GET_MEM_A) begin

                if (mem_ifh.hready) begin
                        mem_ifh.haddr <= addr;
                        mem_ifh.hwrite <= READ;
                        CUR_STATE <= WAIT;
                        NXT_STATE <= GET_MEM_D;
                end

        end else if (CUR_STATE == GET_MEM_D) begin

                if (mem_ifh.hready) begin
                        case (sel)
                                2'd0: begin c_if0h.hrdata <= mem_ifh.hrdata; c_if0h.hready <= '1; mem_ifh.hreq <= '0; end
                                2'd1: begin c_if1h.hrdata <= mem_ifh.hrdata; c_if1h.hready <= '1; mem_ifh.hreq <= '0; end
                                2'd2: begin c_if2h.hrdata <= mem_ifh.hrdata; c_if2h.hready <= '1; mem_ifh.hreq <= '0; end
                                2'd3: begin c_if3h.hrdata <= mem_ifh.hrdata; c_if3h.hready <= '1; mem_ifh.hreq <= '0; end
                        endcase
                        CUR_STATE <= FREE;
                end

        end else begin

                $display ("Unknown State: ", CUR_STATE);

        end
end

endmodule: arbitor
