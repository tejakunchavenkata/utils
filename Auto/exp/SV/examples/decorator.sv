interface class Coffee;
  pure virtual function int cost();
  // pure virtual function int show();
endclass


class SimpleCoffee implements Coffee;
  virtual function int cost();
    return 10;
  endfunction
endclass


virtual class DecoratorBase implements Coffee;
  protected Coffee coffee;

  pure virtual function int cost();

  function Coffee decorate(Coffee coffee);
    this.coffee = coffee;
    return this;
  endfunction : decorate
endclass

class Milk extends DecoratorBase;
  function int cost();
    return coffee.cost()+3;
  endfunction

  // function string desc();
  //   return '{coffee.desc(), " + Milk"};
  // endfunction
endclass

class Sugar extends DecoratorBase;
  function int cost();
    return coffee.cost()+2;
  endfunction

  // function string desc();
  //   return '{coffee.desc(), " + Milk"};
  // endfunction
endclass

module tb();
  initial begin
    Coffee c;
    SimpleCoffee sc = new();
    Milk milkD = new();
    Sugar sugarD = new();

    c = sc;
    $display("Cost is %d", c.cost());

    c = milkD.decorate(c);
    $display("Cost is %d", c.cost());

    c = sugarD.decorate(c);
    $display("Cost is %d", c.cost());
  end
endmodule // tb
