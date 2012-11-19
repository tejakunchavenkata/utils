interface core_cache_if (input clk);
        logic [31:0] addr;
        wire [7:0] data;
        logic ready;
        logic req_valid;
        logic rsp_valid;
        logic write;
        logic flush_all;

        clocking core_cb @ (posedge clk);
                input rsp_valid, ready;
                inout data;
                output addr, req_valid, write, flush_all;
        endclocking

        clocking cache_cb @ (posedge clk);
                output rsp_valid, ready;
                inout data;
                input addr, req_valid, write, flush_all;
        endclocking

        modport core_p (clocking core_cb);
        modport cache_p (clocking cache_cb);        
endinterface
