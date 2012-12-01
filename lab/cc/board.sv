`include "defines.sv"
`include "core_cache_if.sv"
`include "core.sv"
`include "cache.sv"

module board;

reg clk, rst;

core_cache_if c2c_ifh (clk);
//cache_mem_if cache_mem_ifh (clk);

core coreh (clk, rst, c2c_ifh);
cache cacheh (clk, rst, c2c_ifh); //, cache_mem_ifh);

//memory memoryh (clk, rst, cache_mem_ifh);

initial
begin
        rst = '1;
        clk = '0;
        @ (posedge clk);
        @ (negedge clk);
        rst = '0;
end

always
begin
        #(`TIME_PERIOD >> 1) clk = ~clk;
end

initial
begin
        $display ("%s", {100{"-"}});

        @ (negedge clk);
        @ (negedge clk);
        fork
                coreh.run ();
        join

        $display ("%s", {100{"-"}});
        $stop;
end

endmodule
