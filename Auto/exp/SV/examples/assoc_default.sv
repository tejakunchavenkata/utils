module test;

  // int a[int];
  int a[int] = '{default: 1};

  initial begin
    $display(a[1]);
    $display(a.exists(1));
    a[1] += 1;
    $display(a[1]);
    $display(a.exists(1));
  end
endmodule : test
