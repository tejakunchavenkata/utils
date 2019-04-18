program test;

  typedef struct {
    int a;
  } struct_t;

  struct_t assoc[string];

  initial begin
    struct_t s;
    s.a = 10;
    assoc["first"] = s;
    $display(assoc);
    s.a = 20;
    assoc["second"] = s;
    $display(assoc);
  end
endprogram : test
