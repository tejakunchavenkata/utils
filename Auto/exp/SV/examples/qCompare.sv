program test;

  int q1[$];
  int q2[$];

  initial begin
    if (q1 == q2) $display("Hello1");
    q1.push_back(2);
    if (q1 == q2) $display("Hello2");
    q2.push_back(2);
    if (q1 == q2) $display("Hello3");
  end

endprogram : test
