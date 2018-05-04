program test;

  class c;
    static int a;

    static function void fun;
      a = 10;
    endfunction : fun

    function new;
      fun;
    endfunction : new
  endclass : c

  initial begin
    c::fun();;
    $display(c::a);
    // c co = new();
    // $display(c::a, co.a);
  end
endprogram : test
