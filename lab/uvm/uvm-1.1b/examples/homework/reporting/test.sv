//----------------------------------------------------------------------
//   Copyright 2007-2010 Mentor Graphics Corporation
//   Copyright 2007-2011 Cadence Design Systems, Inc.
//   Copyright 2010-2011 Synopsys, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// This example illustrates basic hierarchy construction and test phasing
//----------------------------------------------------------------------

import uvm_pkg::*;
class rpting extends uvm_component;

  //`uvm_component_utils(rpting)
 
  function new(string name,uvm_component parent);
    super.new(name, parent);
  endfunction

  task run();

    uvm_report_info(get_full_name(),
      "Info Message : Verbo lvl - UVM_NONE  ",UVM_NONE,`__FILE__,`__LINE__);

    uvm_report_info(get_full_name(),
      "Info Message : Verbo lvl - UVM_LOW   ",UVM_LOW);

    uvm_report_info(get_full_name(),
      "Info Message : Verbo lvl - 150       ",150);

    uvm_report_info(get_full_name(),
      "Info Message : Verbo lvl - UVM_MEDIUM",UVM_MEDIUM);

    uvm_report_warning(get_full_name(),
      "Warning Messgae from rpting",UVM_LOW);

    uvm_report_error(get_full_name(),
      "Error Message from rpting \n\n",UVM_LOW);
  endtask

endclass

module top;

 rpting rpt1;
 rpting rpt2;
 rpting rpt3;

 initial begin
   rpt1 = new("rpt1",null);
   rpt2 = new("rpt2",null);
   rpt3 = new("rpt3",null);

   rpt1.set_report_verbosity_level(UVM_MEDIUM);
   rpt2.set_report_verbosity_level(UVM_LOW);
   rpt3.set_report_verbosity_level(UVM_NONE);
   run_test();


 end
endmodule
