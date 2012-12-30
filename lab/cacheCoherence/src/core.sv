module core (input reg clk, input reg rst, ahblite_if.master_p cache_if);

typedef enum bit [3:0] {HM_IDLE, HM_REQ, HM_ADDR, HM_WD, HM_RD} ahblite_master_state_t;

parameter MASK = 0;

reg [`ADDR_BUS_WIDTH - 1:0] addr;
byte data;
opr_t write;
ahblite_master_state_t CUR_STATE;
int delay;

always @ (posedge clk) if (delay > 0) delay <= delay - 1;

always @ (posedge clk) begin
        if (rst) begin

                addr <= '0;
                data <= '0;
                write <= READ;
                CUR_STATE <= HM_IDLE;
                delay = `URND % 10;

                cache_if.haddr <= '0;
                cache_if.hwdata <= '0;
                cache_if.hwrite <= READ;
                cache_if.hreq <= '0;

        end else begin
                if (CUR_STATE == HM_IDLE) begin

                        if (delay > 0) begin
                                CUR_STATE <= HM_IDLE;
                        end else begin
                                addr = `URND;
                                addr[`ADDR_BUS_WIDTH - 1:`ADDR_BUS_WIDTH - `TAG_WIDTH] = (((1 << `TAG_WIDTH) - 1) & MASK);
                                write = opr_t' (`URND % 2);
                                if (write == WRITE) data = `URND;

                                cache_if.hreq <= '1;
                                CUR_STATE <= HM_REQ;
                        end

                end else if (CUR_STATE == HM_REQ) begin

                        if (cache_if.hgrant && cache_if.hready) begin
                                cache_if.haddr <= addr;
                                cache_if.hwrite <= write;
                                CUR_STATE <= HM_ADDR;
                        end else begin
                                CUR_STATE <= HM_REQ;
                        end

                end else if (CUR_STATE == HM_ADDR) begin

                        if (write == WRITE) begin
                                cache_if.hwdata <= data;
                                cache_if.hreq <= '0;
                                CUR_STATE <= HM_WD;
                        end else begin
                                CUR_STATE <= HM_RD;
                        end

                end else if (CUR_STATE == HM_WD) begin

                        delay = `URND % 20;
                        CUR_STATE <= HM_IDLE;

                end else if (CUR_STATE == HM_RD) begin

                        if (cache_if.hready) begin
                                data <= cache_if.hrdata;
                                cache_if.hreq <= '0;
                                delay = `URND % 20;
                                CUR_STATE <= HM_IDLE;
                        end else begin

                        end
                end else begin
                        $display ("Unknown State");
                end
        end
end

endmodule : core
