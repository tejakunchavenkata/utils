module core (core_cache_if.core_p core2cache_if);

typedef enum {READ, WRITE} opr_t;
class packet;
        rand bit [31:0] addr;
        rand bit [31:0] data;
        rand opr_t opr_w;
endclass

function void place_req ();
begin
        static packet p = new;
        repeat (10)
        begin
                //p.randomize ();
                p.addr = $random; p.data = $random; p.opr_w = opr_t'($random%2);
                $display ("addr: 0x%08X", p.addr, "\tdata: 0x%08X", p.data, "\topr: ", p.opr_w);
        end
end
endfunction

endmodule