`include "cache_defines.sv"

module cache (input reg clk, input reg rst, core_cache_if.cache_p core_ifh, cache_mem_if.cache_p mem_ifh);

reg [`BLOCK_SIZE - 1 : 0] [7:0] data_ram        [`NUM_LINES-1:0];
reg [`TAG_WIDTH - 1 : 0]        tag_ram         [`NUM_LINES-1:0];
reg [1 : 0]                     status_ram      [`NUM_LINES-1:0];

wire [`TAG_WIDTH - 1 : 0] tag;
wire [`LOG2_NUM_LINES - 1 : 0] line;
wire miss;

assign line = core_ifh.cache_cb.addr[`LOG2_BLOCK_SIZE + `LOG2_NUM_LINES - 1 : `LOG2_BLOCK_SIZE];
assign tag  = core_ifh.cache_cb.addr[`SYS_BUS_WIDTH - 1 : `LOG2_BLOCK_SIZE + `LOG2_NUM_LINES];
assign miss = ~(status_ram[line][`VALID] && (tag_ram[line] === tag));

task flush_line ();
        do begin
                //@ (posedge clk);
                if (mem_ifh.cache_cb.ready) begin
                        mem_ifh.cache_cb.addr <= core_ifh.cache_cb.addr[`SYS_BUS_WIDTH - 1:`LOG2_BLOCK_SIZE];
                        mem_ifh.cache_cb.data_out <= data_ram[line];
                        if (data_ram[line] === 'hx) $display ($time, " Err occured at LINE: ", line, " Status: ", status_ram[line]);
        $display ($time, " DEBUG2: ", line);
                        mem_ifh.cache_cb.write <= '1;
        $display ($time, " DEBUG2: ", line);
                        mem_ifh.cache_cb.req_valid <= '1;
                        break;
                end
        end
        while (1);

        @ (posedge clk);
        do begin
                @ (posedge clk);
                if (mem_ifh.cache_cb.ready) begin
                        mem_ifh.cache_cb.req_valid <= '0;
                        break;
                end
        end
        while (1);
        status_ram[line][`VALID] = '0;
endtask

task load_line ();
        $display ($time, " DEBUG: ", line);
        if (status_ram[line][`VALID] && status_ram[line][`MODIFIED]) flush_line ();

        do begin
                @ (posedge clk);
                if (mem_ifh.cache_cb.ready) begin
                        mem_ifh.cache_cb.addr <= core_ifh.cache_cb.addr[`SYS_BUS_WIDTH - 1:`LOG2_BLOCK_SIZE];
                        mem_ifh.cache_cb.write <= '0;
                        mem_ifh.cache_cb.req_valid <= '1;
                        break;
                end
        end
        while (1);

        @ (posedge clk);
        do begin
                @ (posedge clk);
                if (mem_ifh.cache_cb.ready) begin
                        data_ram[line] = mem_ifh.cache_cb.data_in;
                        break;
                end
        end
        while (1);

        mem_ifh.cache_cb.req_valid <= '0;
        status_ram[line][`VALID] = '1;
endtask

always @ (posedge clk) begin
        if (rst) begin
                for (int i=0; i<`NUM_LINES; i++) begin
                        status_ram[i] <= '0;
                end

                core_ifh.cache_cb.ready <= '1;
                core_ifh.cache_cb.data_in <= '0;

                mem_ifh.cache_cb.cache_miss <= '0;
                mem_ifh.cache_cb.addr <= '0;
                mem_ifh.cache_cb.data_out <= '0;
                mem_ifh.cache_cb.write <= '0;
                mem_ifh.cache_cb.req_valid <= '0;
        end else if (core_ifh.cache_cb.req_valid) begin
                core_ifh.cache_cb.ready <= '0;
                mem_ifh.cache_cb.cache_miss <= miss;

                if (miss) load_line ();

                if (core_ifh.cache_cb.write) begin
                        data_ram[line][core_ifh.cache_cb.addr[`LOG2_BLOCK_SIZE - 1:0]] <= core_ifh.cache_cb.data_out;
                        status_ram[line][`MODIFIED] <= '1;
                end else begin
                        core_ifh.cache_cb.data_in <= data_ram[line][core_ifh.cache_cb.addr[`LOG2_BLOCK_SIZE - 1:0]];
                end
                core_ifh.cache_cb.ready <= '1;
                @ (posedge clk);
        end
end

endmodule
