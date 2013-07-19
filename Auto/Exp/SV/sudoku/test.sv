`include "board.sv"

program test;
  board b1 = new;

  initial begin
    b1.show ();
  end
endprogram: test
