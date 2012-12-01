class packet;
        rand bit [`ADDR_BUS_WIDTH - 1:0] addr;
        rand byte data;
        rand bit write;

        function show () begin
                if (write) begin
                        $display ("0x%08X Write 0x%08X", addr, data);
                end else begin
                        $display ("0x%08X Read", addr);
                end
        end
endclass

program core (input clk, input rst, core_cache_if.core_p cache_if);
        packet dp = new ();

        forever begin
                @ (posedge clk);

                if (rst) continue;

                dp.randomize ();
                dp.show ();
        end
begin

endprogram
