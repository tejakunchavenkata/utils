interface class Coffee;
   pure virtual function int cost();
endclass
 
class SimpleCoffee implements Coffee;
   virtual function int cost();
       return 1000;
   endfunction
endclass
 
virtual class DecoratorBase implements Coffee;
   pure virtual function int cost();
   pure virtual function Coffee decorate(Coffee coffee);
endclass
 
class Milk extends DecoratorBase;
   Coffee coffee;
   function Coffee decorate(Coffee coffee);
      this.coffee=coffee;
      return this;
   endfunction
 
   function int cost();
      return coffee.cost()+100;
   endfunction
endclass
 
module tb();
   initial begin
      Coffee c1;
      SimpleCoffee sc;
      Milk   d3;
 
      sc = new;
      c1 = sc;
      d3 = new();
      c1=d3.decorate(c1);
 
      $display("## x1 cost is %d", c1.cost()); //  1000 (I expect to yield 1120; 1000+10+10+100)
   end
endmodule // tb
