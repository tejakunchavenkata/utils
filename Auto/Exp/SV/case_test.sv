module case_test ;
reg [1:0] element;

initial
begin
    element = 2'b01;
    case (element)
        2'b00, 2'b01, 2'b10:    $display ("10");
        2'b11:                  $display ("11");
        default:                $display ("Nothing");
    endcase
end
endmodule        
