program test;

  int assoc[int];

  initial begin
    assoc = '{
      0:0,
      1:1,
      2:2,
      3:3,
      4:4,
      5:5
    };

    foreach (assoc[x]) begin
      $display(assoc[x]);
      if (x == 3) begin
        assoc.delete(4);
        assoc[6] = 6;
      end
    end
  end

endprogram : test
