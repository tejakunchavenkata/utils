module test;

  // int a[int];
  int a[int] = '{default: 1};

  initial begin
    $display(a[1]);
    $display(a.exists(1));
    a[1] += 1;
    $display(a[1]);
    $display(a.exists(1));

    a = '{default: 100};
    $display(a[2]);
    $display(a.exists(2));
    a[2] += 1;
    $display(a[1]);
    $display(a[2]);
    $display(a.exists(2));

  end
endmodule : test
