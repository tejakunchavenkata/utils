program test;

  class base;
    function new;
      $display("Base New");
    endfunction : new
  endclass : base

  class child extends base;
    int a;

    function new;
      a = 10;
    endfunction : new
  endclass : child

  child c;
  initial begin
    c = new;
  end

endprogram : test
