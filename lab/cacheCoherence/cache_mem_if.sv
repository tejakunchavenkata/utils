`include "cache_defines.sv"

interface cache_mem_if (input clk);
        logic [`SYS_BUS_WIDTH - 1:`LOG2_BLOCK_SIZE] addr;
        wire [`BLOCK_SIZE - 1:0] [7:0] data_in;
        wire [`BLOCK_SIZE - 1:0] [7:0] data_out;
        logic ready;
        logic req_valid;
        //logic rsp_valid;
        logic write;
        logic cache_miss;

        clocking cache_cb @ (posedge clk);
                input ready, data_in;
                output addr, req_valid, write, cache_miss, data_out;
        endclocking

        clocking mem_cb @ (posedge clk);
                output ready, data_in;
                input addr, req_valid, write, cache_miss, data_out;
        endclocking

        modport mem_p (clocking mem_cb);
        modport cache_p (clocking cache_cb); 
endinterface
