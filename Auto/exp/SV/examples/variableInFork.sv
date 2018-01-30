program test;

  function show (input int a);
    $display(">>> ", a);
  endfunction : show

  initial begin
    for (int i = 0; i< 10; i++) fork
      show(i);
    join_none
    for (int i = 0; i< 10; i++) fork
      show(i);
    join_any
    for (int i = 0; i< 10; i++) fork
      show(i);
    join
  end
endprogram : test
