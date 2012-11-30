`include "cache_defines.sv"

module memory (input reg clk, input reg rst, cache_mem_if.mem_p cache_ifh);

reg [`BLOCK_SIZE - 1:0] [7:0] memory [*];
int delay;

always @ (posedge clk)
begin
        if (delay)
        begin
                delay--;
        end
end

always @ (posedge clk)
begin
        if (rst) begin
                cache_ifh.mem_cb.ready <= '1;
                cache_ifh.mem_cb.data_in <= '0;
                delay = 0;
        end else begin
                if (cache_ifh.mem_cb.req_valid) begin
                        cache_ifh.mem_cb.ready <= '0;

                        delay = unsigned'($random & 7);
                        @ (posedge clk);
                        wait (delay == 0);

                        if (cache_ifh.mem_cb.write) begin
                                memory [cache_ifh.mem_cb.addr] = cache_ifh.mem_cb.data_out;
                        end else begin
                                for (int i = 0; i < `BLOCK_SIZE; i++)
                                begin
                                        memory [cache_ifh.mem_cb.addr][i] = $random;
                                end
                                cache_ifh.mem_cb.data_in <= memory [cache_ifh.mem_cb.addr];
                        end

                        cache_ifh.mem_cb.ready <= '1;
                        @ (posedge clk);
                end
        end
end

endmodule
