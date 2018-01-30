program test;

  int q[$];

  initial begin
    q.push_back(1);
    q.push_back(2);
    q.push_back(3);
    q.push_back(4);
    q.push_back(5);
    q.push_back(6);
    q.push_back(7);
    q.push_back(8);
    q.push_back(9);
    q.push_back(0);
    $display(q);
    q.shuffle;
    $display(q);
  end
endprogram : test
