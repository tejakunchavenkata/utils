program test;

  initial begin
    `line 10 "-" 1
    $display(`__FILE__, `__LINE__);
  end

endprogram : test
