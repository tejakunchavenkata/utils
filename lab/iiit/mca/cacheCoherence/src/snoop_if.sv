interface snoop_if (input clk);

        logic snoop_valid;
        logic [`ADDR_BUS_WIDTH - 1:`LOG2_LINE_SIZE] saddr;
        logic [`LINE_SIZE - 1:0][7:0] sdata;
        line_state_t sc_state, sn_state;

        transfer_t t_type;
        broadcast_t broadcast;
        logic other_copies;
/*
        clocking master_cb @ (posedge clk);
                //default input #10ps output #10ps;

                input other_copies;
                output t_type, broadcast;
        endclocking

        clocking slave_cb @ (posedge clk);
                //default input #10ps output #10ps;

                input snoop_valid, saddr, sn_state;
                output sc_state, sdata;
        endclocking

        clocking bus_cb @ (posedge clk);
                //default input #10ps output #10ps;
                
                input t_type, broadcast;
                output other_copies;

                input sc_state;
                output snoop_valid, saddr, sn_state;
        endclocking

        modport master_p (clocking master_cb);
        modport slave_p (clocking slave_cb);
        modport bus_p (clocking bus_cb);
*/

        modport master_p (
                input other_copies,
                output t_type, broadcast
        );

        modport slave_p (
                input snoop_valid, saddr, sn_state,
                output sc_state, sdata
        );

        modport bus_p (
                input sc_state, sdata, t_type, broadcast,
                output snoop_valid, saddr, sn_state, other_copies
        );

endinterface
