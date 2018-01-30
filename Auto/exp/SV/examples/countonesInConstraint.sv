program test;

  int x;

  initial begin
    std::randomize(x) with {
      $countones(x) == 10;
    };
    $displayb(x);
  end
endprogram : test
