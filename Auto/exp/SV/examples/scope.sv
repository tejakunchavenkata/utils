program test;

  int x;

  function void bla;
    string str1 = $sformatf("%m");
    string str2;
    str2 = $sformatf("%m");

    $display("%m");
    $display(str1);
    $display(str2);
  endfunction : bla

  initial begin : blaa
    bla();
  end

endprogram : test
