module cache (input reg clk, input reg rst, cache_mem_if.mem_p mem_ifh);
//output rsp_valid, ready;
//inout data;
//input addr, req_valid, write, cache_miss;

int delay;

always @ (posedge clk)
begin
        if (rst) begin
                rsp_valid <= '0;
                ready <= '1;
        end else begin
                if (req_valid) begin
                        if (write) begin
                        end else begin
                        end
                end
        end
end

endmodule
