`include "cache_defines.sv"
interface core_cache_if (input clk);
        logic [`SYS_BUS_WIDTH - 1:0] addr;
        wire [7:0] data_in;
        wire [7:0] data_out;
        logic ready;
        logic req_valid;
        logic write;
        logic flush_all;

        clocking core_cb @ (posedge clk);
                input ready, data_in;
                output addr, req_valid, write, flush_all, data_out;
        endclocking

        clocking cache_cb @ (posedge clk);
                output ready, data_in;
                input addr, req_valid, write, flush_all, data_out;
        endclocking

        modport core_p (clocking core_cb);
        modport cache_p (clocking cache_cb);

       /*
        modport core_p (
                input ready, data_in,
                output addr, req_valid, write, flush_all, data_out
        );

        modport cache_p (
                output ready, data_in,
                input addr, req_valid, write, flush_all, data_out
        );
        */

endinterface
