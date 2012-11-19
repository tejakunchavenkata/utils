`include "cache_defines.sv"

interface cache_mem_if (input clk);
        logic [`SYS_BUS_WIDTH - 1:`BLOCK_SIZE] addr;
        wire [`BLOCK_SIZE - 1:0] data;
        logic ready;
        logic req_valid;
        logic rsp_valid;
        logic write;
        logic cache_miss;

        clocking mem_cb @ (posedge clk);
                output rsp_valid, ready;
                inout data;
                input addr, req_valid, write, cache_miss;
        endclocking

        clocking cache_cb @ (posedge clk);
                input rsp_valid, ready;
                inout data;
                output addr, req_valid, write, cache_miss;
        endclocking

        modport mem_p (clocking mem_cb);
        modport cache_p (clocking cache_cb); 
endinterface
