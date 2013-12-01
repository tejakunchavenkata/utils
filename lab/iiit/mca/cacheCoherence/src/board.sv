`include "defines.sv"

`include "ahblite_if.sv"
`include "snoop_if.sv"

`include "core.sv"
`include "cache.sv"
`include "arbitor.sv"
`include "memory.sv"

`define FORMAT_AHB_LITE_IF(ifh) ifh.hreq, ifh.hgrant, ifh.hready, ifh.hrsp, " %x %x ...%x ...%x", ifh.haddr, ifh.hwrite, ifh.hrdata[0], ifh.hwdata[0]
`define FORMAT_SNOOP_IF(ifh) ifh.other_copies, " %-6s %-6s %x %-8s %-8s %x ...%x", ifh.t_type.name, ifh.broadcast.name, ifh.snoop_valid, ifh.sn_state.name, ifh.sc_state.name, ifh.saddr, ifh.sdata[0]

module board;

reg clk, rst;
int clkCnt, trash;

initial clk = '0;
always #(`TIME_PERIOD >> 1) clk = ~clk;

initial begin
        rst = '1;
        @ (negedge clk) rst = '0;
end

initial trash = $random (`RND_SEED);

initial clkCnt = 0;
always @ (negedge clk) clkCnt = clkCnt + 1;

ahblite_if core2cache_if0h (clk);
ahblite_if core2cache_if1h (clk);
ahblite_if core2cache_if2h (clk);
ahblite_if core2cache_if3h (clk);

ahblite_if #`LOG2_LINE_SIZE cache2arb_if0h (clk);
ahblite_if #`LOG2_LINE_SIZE cache2arb_if1h (clk);
ahblite_if #`LOG2_LINE_SIZE cache2arb_if2h (clk);
ahblite_if #`LOG2_LINE_SIZE cache2arb_if3h (clk);

ahblite_if #`LOG2_LINE_SIZE arb2mem_ifh (clk);

snoop_if cache2arb_if0hs (clk); //, arb2cache_if0hs (clk);
snoop_if cache2arb_if1hs (clk); //, arb2cache_if1hs (clk);
snoop_if cache2arb_if2hs (clk); //, arb2cache_if2hs (clk);
snoop_if cache2arb_if3hs (clk); //, arb2cache_if3hs (clk);

core #(0) core0h (clk, rst, core2cache_if0h);
core #(0) core1h (clk, rst, core2cache_if1h);
core #(0) core2h (clk, rst, core2cache_if2h);
core #(0) core3h (clk, rst, core2cache_if3h);

cache cache0h (clk, rst, core2cache_if0h, cache2arb_if0h, cache2arb_if0hs, cache2arb_if0hs); //arb2cache_if0hs);
cache cache1h (clk, rst, core2cache_if1h, cache2arb_if1h, cache2arb_if1hs, cache2arb_if1hs); //arb2cache_if1hs);
cache cache2h (clk, rst, core2cache_if2h, cache2arb_if2h, cache2arb_if2hs, cache2arb_if2hs); //arb2cache_if2hs);
cache cache3h (clk, rst, core2cache_if3h, cache2arb_if3h, cache2arb_if3hs, cache2arb_if3hs); //arb2cache_if3hs);

arbitor arb (clk, rst,
        cache2arb_if0h, cache2arb_if0hs,
        cache2arb_if1h, cache2arb_if1hs,
        cache2arb_if2h, cache2arb_if2hs,
        cache2arb_if3h, cache2arb_if3hs,
        arb2mem_ifh
);

memory memoryh (clk, rst, arb2mem_ifh);

initial begin
        $display ("%s", {100{"-"}});
        //$monitor ($time, "Line state... ", cache0h.status_ram[0].name);
        #1000000;
        $display ("%s", {100{"-"}});
        $finish;
        //$stop;
end

//always @ (negedge clk) if (!rst) $display ("%-9d %s", $time, {10{"-"}});

`ifdef DATA_TRACE
always @ (negedge clk) if (!rst) begin
        $display ("%-9d %s", $time, {10{"-"}});
        $display ("C-C#0 ", `FORMAT_AHB_LITE_IF (core2cache_if0h), " --- C#0-Bus ", `FORMAT_AHB_LITE_IF (cache2arb_if0h), " <-> ", `FORMAT_SNOOP_IF (cache2arb_if0hs));
        $display ("C-C#1 ", `FORMAT_AHB_LITE_IF (core2cache_if1h), " --- C#1-Bus ", `FORMAT_AHB_LITE_IF (cache2arb_if1h), " <-> ", `FORMAT_SNOOP_IF (cache2arb_if1hs));
        $display ("C-C#2 ", `FORMAT_AHB_LITE_IF (core2cache_if2h), " --- C#2-Bus ", `FORMAT_AHB_LITE_IF (cache2arb_if2h), " <-> ", `FORMAT_SNOOP_IF (cache2arb_if2hs));
        $display ("C-C#3 ", `FORMAT_AHB_LITE_IF (core2cache_if3h), " --- C#3-Bus ", `FORMAT_AHB_LITE_IF (cache2arb_if3h), " <-> ", `FORMAT_SNOOP_IF (cache2arb_if3hs));
        $monitor (" Mem: ", `FORMAT_AHB_LITE_IF (arb2mem_ifh));
end
`endif

`define TRAFFIC_TRACE

`ifdef TRAFFIC_TRACE

always @ (posedge core2cache_if0h.hreq) $display ("%-9d: C -> C#0", $time);
always @ (negedge core2cache_if0h.hreq) $display ("%-9d: C <- C#0", $time);

always @ (posedge core2cache_if1h.hreq) $display ("%-9d:          C -> C#1", $time);
always @ (negedge core2cache_if1h.hreq) $display ("%-9d:          C <- C#1", $time);

always @ (posedge core2cache_if2h.hreq) $display ("%-9d:                   C -> C#2", $time);
always @ (negedge core2cache_if2h.hreq) $display ("%-9d:                   C <- C#2", $time);

always @ (posedge core2cache_if3h.hreq) $display ("%-9d:                            C -> C#3", $time);
always @ (negedge core2cache_if3h.hreq) $display ("%-9d:                            C <- C#3", $time);
`endif

endmodule
