`include "cache_defines.sv"
interface cache_mem_if (input clk);
        logic [`SYS_BUS_WIDTH - 1:`LOG2_BLOCK_SIZE] addr;
        logic cache_miss;
        logic [`BLOCK_SIZE - 1 : 0] [7:0] data_in;
        logic [`BLOCK_SIZE - 1 : 0] [7:0] data_out;
        logic ready;
        logic req_valid;
        logic write;

        clocking mem_cb @ (posedge clk);
                input addr, cache_miss, req_valid, write, data_out;
                output ready, data_in;
        endclocking

        clocking cache_cb @ (posedge clk);
                output addr, cache_miss, req_valid, write, data_out;
                input ready, data_in;
        endclocking

        modport mem_p (clocking mem_cb);
        modport cache_p (clocking cache_cb);        

        /*
        modport mem_p (
                input addr, cache_miss, req_valid, write, data_out,
                output ready, data_in
        );

        modport cache_p (
                output addr, cache_miss, req_valid, write, data_out,
                input ready, data_in
        );
        */

endinterface
