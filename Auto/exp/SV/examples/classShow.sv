program test;

  class c;
    int a;
    string b;

    local int x;

    function void foo;
      $display("In Foo");
    endfunction : foo
  endclass : c

  initial begin
    c obj = new;

    $display(obj);
  end

endprogram : test
