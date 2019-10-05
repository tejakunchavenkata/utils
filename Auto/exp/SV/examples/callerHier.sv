program test;

  int a = 10;

  function void foo (input int x=a, string scope=$sformatf("%m"));
    $display(scope, a);
  endfunction : foo

  initial begin : bla
    int a = 100;
    foo();
  end
endprogram : test
