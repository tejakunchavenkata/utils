interface ahblite_if (input clk);
        parameter ADDR_LSB = 0;

        logic [`ADDR_BUS_WIDTH - 1:ADDR_LSB]    haddr;
        logic [(1 << ADDR_LSB) - 1:0] [7:0]     hrdata;
        logic [(1 << ADDR_LSB) - 1:0] [7:0]     hwdata;
        opr_t                                   hwrite;
        logic                                   hreq;
        logic                                   hgrant;
        logic                                   hready;
        logic                                   hrsp;

        /*
        clocking master_cb @ (posedge clk);
                default input #10ps output #10ps;

                input hrdata, hready, hgrant, hrsp;
                output haddr, hwdata, hwrite, hreq;
        endclocking

        clocking slave_cb @ (posedge clk);
                default input #10ps output #10ps;

                output hrdata, hready, hgrant, hrsp;
                input haddr, hwdata, hwrite, hreq;
        endclocking

        modport master_p (clocking master_cb);
        modport slave_p (clocking slave_cb);
        */

        modport master_p (
                input hrdata, hready, hgrant, hrsp,
                output haddr, hwdata, hwrite, hreq
        );
        modport slave_p (
                output hrdata, hready, hgrant, hrsp,
                input haddr, hwdata, hwrite, hreq
        );
endinterface
