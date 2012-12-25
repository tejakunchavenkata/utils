module memory (input reg clk, rst, ahblite_if.slave_p bus_ifh);

typedef enum bit [3:0] {HS_IDLE, HS_GRANT, HS_ADDR, HS_WD, HS_WDONE, HS_RD} ahblite_slave_state_t;

bit [`LINE_SIZE - 1:0][7:0] mem [*];
bit [`LINE_SIZE - 1:0][7:0] buffer;
int delay;
ahblite_slave_state_t CUR_STATE;
reg [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE] addr;

always @ (posedge clk) if (delay > 0) delay <= delay - 1;

function rndLine (input reg [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE] myAddr);
        for (int i=0; i<`LINE_SIZE; i++) begin
                mem [myAddr][i] = `URND;
        end
endfunction


always @ (posedge clk) begin
        if (rst) begin

                CUR_STATE <= HS_IDLE;
                delay = '0;
                addr <= '0;
                buffer = '0;

                bus_ifh.hgrant <= '1;
                bus_ifh.hready <= '0;
                bus_ifh.hrdata <= '0;
                bus_ifh.hrsp <= '0;

        end else begin
                if (CUR_STATE == HS_IDLE) begin

                        if (bus_ifh.hreq) begin
                                bus_ifh.hready <= '1;
                                CUR_STATE <= HS_GRANT;
                        end else begin
                                bus_ifh.hready <= '0;
                        end

                end else if (CUR_STATE == HS_GRANT) begin

                        CUR_STATE <= HS_ADDR;

                end else if (CUR_STATE == HS_ADDR) begin

                        addr <= bus_ifh.haddr;
                        if (! mem.exists(bus_ifh.haddr [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE])) begin
                                //$display ($time, " New-access on line: 0x%08X", bus_ifh.haddr);
                                void' (rndLine (bus_ifh.haddr [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE]));
                        end else begin
                                //$display ($time, "  Re-access on line: 0x%08X", bus_ifh.haddr);
                        end

                        if ( bus_ifh.hwrite ) begin
                                CUR_STATE <= HS_RD;
                        end else begin
                                delay <= `URND % 4;
                                bus_ifh.hready <= '0;
                                CUR_STATE <= HS_WD;
                        end

                end else if (CUR_STATE == HS_WD) begin

                        if (! delay) begin
                                bus_ifh.hrdata <= mem [addr];
                                buffer <= mem [addr];
                                bus_ifh.hready <= '1;
                                CUR_STATE <= HS_WDONE;
                        end

                end else if (CUR_STATE == HS_WDONE) begin

                        bus_ifh.hready <= '0;
                        CUR_STATE <= HS_IDLE;

                end else if (CUR_STATE == HS_RD) begin

                        mem [addr] <= bus_ifh.hwdata;
                        buffer <= bus_ifh.hwdata;
                        bus_ifh.hready <= '0;
                        CUR_STATE <= HS_IDLE;

                end else begin
                        $display ("Unknown State");
                end
        end
end

endmodule
