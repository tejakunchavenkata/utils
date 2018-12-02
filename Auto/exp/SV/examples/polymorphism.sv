program test;
  class first;
    virtual function void show();
      $display("In first");
    endfunction
  endclass : first

  class second extends first;
    function void show();
      $display("In second");
    endfunction
  endclass : second

  initial begin
    first f = new();
    second s = new();

    f.show();
    s.show();

    f = s;
    // s = f;
    f.show();
    s.show();
  end

endprogram : test
