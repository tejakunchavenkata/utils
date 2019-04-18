program test;

  typedef enum {
    BLA_A,
    BLA_B,
    BLA_C
  } enum_t;

  typedef int assoc_t [enum_t];
  class c;
    static assoc_t sassoc;
    assoc_t assoc;
  endclass : c

  initial begin
    c cobj1 = new, cobj2 = new;

    cobj1.assoc = '{BLA_A: 10};
    cobj1.sassoc = '{BLA_A: 100};
    $display(cobj1.assoc, "\n", cobj1.sassoc);
    $display(cobj2.assoc, "\n", cobj2.sassoc);
  end
endprogram : test
