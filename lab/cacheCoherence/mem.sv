`include "cache_defines.sv"

module memory (input reg clk, input reg rst, cache_mem_if.mem_p cache_ifh);

reg [`BLOCK_SIZE - 1:0] [7:0] memory [*];
int delay;

always @ (posedge clk)
begin
        if (rst) begin
                cache_ifh.mem_cb.ready <= '1;
                cache_ifh.mem_cb.data_in <= '0;
        end else begin
                if (cache_ifh.mem_cb.req_valid) begin
                        cache_ifh.mem_cb.ready <= '0;

                        delay = unsigned'(1 + $random & 15);
                        repeat (delay) @ (posedge clk);

                        if (cache_ifh.mem_cb.write) begin
                                memory [cache_ifh.mem_cb.addr] = cache_ifh.mem_cb.data_out;
                        end else begin
                                memory [cache_ifh.mem_cb.addr] = $random;
                                cache_ifh.mem_cb.data_in <= memory [cache_ifh.mem_cb.addr];
                        end

                        cache_ifh.mem_cb.ready <= '1;
                        @ (posedge clk);
                end
        end
end

endmodule
