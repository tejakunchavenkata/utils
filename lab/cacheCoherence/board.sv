`include "cache_defines.sv"

module board;

reg clk, rst;
core_cache_if core_cache_ifh (clk);
cache_mem_if cache_mem_ifh (clk);

core coreh (clk, rst, core_cache_ifh);
cache cacheh (clk, rst, core_cache_ifh, cache_mem_ifh);
memory memoryh (clk, rst, cache_mem_ifh);

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
        #5 clk = ~clk;
end

initial
begin
        $display ("%s", {100{"-"}});

        /*
        $display ("SYS_BUS_WIDTH: ", `SYS_BUS_WIDTH);
        $display ("BLOCK_SIZE: ", `BLOCK_SIZE);
        $display ("LOG2_BLOCK_SIZE: ", `LOG2_BLOCK_SIZE);
        $display ("NUM_LINES: ", `NUM_LINES);
        $display ("LOG2_NUM_LINES: ", `LOG2_NUM_LINES);
        $display ("TAG_WIDTH: ", `TAG_WIDTH);
        */

        @ (negedge clk);
        @ (negedge clk);
        fork
                coreh.run ();
        join

        $display ("%s", {100{"-"}});
        repeat (20) @ (negedge clk);
        $stop;
end

endmodule
