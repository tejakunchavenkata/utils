program test;

  typedef enum {
    ENUM_0,
    ENUM_1,
    ENUM_2
  } theType;

  typedef theType theTypeQ_t[$];

  function theTypeQ_t foo;
    return '{ENUM_0, ENUM_1};
  endfunction : foo

  initial begin
    theType bla = ENUM_0;
    theTypeQ_t q;
    $display(bla inside q);
    $display(ENUM_0 inside q);
    q = '{ENUM_0, ENUM_1};
    $display(bla inside q);
    $display(ENUM_0 inside q);

    $display(bla inside '{foo()});
    $display(ENUM_0 inside '{foo()});
  end
endprogram : test
