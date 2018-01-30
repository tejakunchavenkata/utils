program test;

  int assoc [int];

  initial begin
    assoc[1] = 10;
    $display(assoc);

    assoc[2] = 10;
    assoc[3] = 10;
    assoc[4] = 10;
    $display(assoc);
    assoc.delete(1);
    $display(assoc);
    assoc.delete();
    $display(assoc);
  end
endprogram : test
