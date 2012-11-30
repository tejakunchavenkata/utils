module core (input reg clk, input reg rst, core_cache_if.core_p cache_if);
//input ready;
//inout data;
//output addr, req_valid, write, flush_all;

typedef enum {READ, WRITE} opr_t;
bit [31:0] addr;
bit [7:0] data;
opr_t opr_w;

int FH, delay;

task run ();
begin
        FH = $fopen ("ip", "r");

        //addr = $random; data = $random; opr_w = opr_t'(unsigned'($random%2));
        if (!FH) begin
                $display ("Opening ip failed");
        end else begin
                while (!$feof(FH)) begin
                        @ (posedge clk);
                        
                        $fscanf (FH, "%x %x %d %d", addr, data, opr_w, delay);
                        // $display ("addr: 0x%08X", addr, "\tdata: 0x%X", data, "\topr: ", opr_w);
             
                        // Place request
                        cache_if.core_cb.addr <= addr;
                        if (opr_w) begin
                                cache_if.core_cb.data_out <= data;
                                cache_if.core_cb.write <= '1;
                        end else begin
                                cache_if.core_cb.write <= '0;
                        end

                        // Assert request
                        @ (posedge clk);
                        cache_if.core_cb.req_valid <= '1;
                        @ (posedge clk);

                        do begin
                                @ (posedge clk);
                                if (cache_if.core_cb.ready) begin
                                        cache_if.core_cb.req_valid <= '0;
                                        break;
                                end
                        end while (1);
                        
                        repeat (delay) @ (posedge clk);                        
                end
                $fclose (FH);
        end
end
endtask

always @ (posedge clk)
begin
        if (rst)
        begin
                cache_if.core_cb.addr <= '0;
                cache_if.core_cb.data_out <= '0;
                cache_if.core_cb.req_valid <= '0;
                cache_if.core_cb.write <= '0;
                cache_if.core_cb.flush_all <= '0;
        end
end

endmodule
