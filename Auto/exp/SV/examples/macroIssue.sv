program test;

  `define MACRO(x) x << 1

  initial begin
    $display(">>> ", `MACRO(1) + 5);
  end
endprogram : test
