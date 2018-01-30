program test;

  int q[$], idx, x;

  initial begin
    q = '{0, 1, 2, 3, 4, 5};
    $display(q);

    idx = 2;
    repeat (10) begin
      x = q[idx];
      q.delete(idx);
      $display(q, " ", x);
      q.push_back(x);
    end
  end
endprogram : test
