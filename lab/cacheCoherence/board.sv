`include "cache_defines.sv"

module board;

reg clk, rst;
core_cache_if core_cache_ifh (clk);
cache_mem_if cache_mem_ifh (clk);

core coreh (core_cache_ifh);
cache cacheh (clk, rst, core_cache_ifh, cache_mem_ifh);

initial
begin
        rst = '1;
        clk = '0;
        @ (posedge clk);
        rst = '0;
end

always
begin
        #5 clk = ~clk;
end

initial
begin
        $display ("%s", {100{"-"}});
        @ (posedge clk);
        @ (posedge clk);
        coreh.place_req ();
        $display ("%s", {100{"-"}});
        //#100 $finish;
end

endmodule
