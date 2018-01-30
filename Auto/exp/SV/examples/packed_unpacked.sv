program test;

  bit [1:0] [4] x [8] [0 : 15];

  initial begin
    foreach (x[i])
      foreach (x[i][j])
        foreach (x[i][j][k])
          foreach (x[i][j][k][l])
            $display("%d %d %d %d", i, j, k, l);

    // x = '1;
  end

endprogram : test
