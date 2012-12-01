interface core_cache_if (input clk);
        default input #1ns output #1ns;

        logic [`SYS_BUS_WIDTH - 1:0]    haddr;
        logic byte                      hrdata;
        logic byte                      hwdata;
        logic                           hwrite;
        logic                           hreq;
        logic                           hgrant;
        logic                           hready;

        clocking core_cb @ (posedge clk);
                input hrdata, hready, hgrant;
                output haddr, hwdata, hwrite, hreq;
        endclocking

        clocking cache_cb @ (posedge clk);
                output hrdata, hready, hgrant;
                input haddr, hwdata, hwrite, hreq;
        endclocking

        modport core_p (clocking core_cb);
        modport cache_p (clocking cache_cb);
endinterface
