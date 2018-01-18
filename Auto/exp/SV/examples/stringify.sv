program test;

  `define STRINGIFY(x) `"x`"

  string str;

  initial begin
    str = `STRINGIFY(Bla);
    $display(">>> %d %s", str.len(), str);
    str = `STRINGIFY(
      Bla \n \
      Bla
    );
    $display(">>> %d %s", str.len(), str);
  end
endprogram : test
