program test;

  int q[$][$];

  initial begin
    $displayh(q.size());
    $displayh(q[0]);
    $displayh(q[0][1]);
  end

endprogram : test
