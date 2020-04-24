// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "assertion.sv"
`include "test.sv"

  module top();
      reg clk = 0;
        // clock generator
  initial
    forever #5 clk = ~clk;

      // DUT/assertion monitor/testcase instances
      intf_cnt intf(clk);
    dff DUT(clk,intf.reset,intf.din,intf.dout);
      testcase test(intf);
      assertion_cov acov(intf);
    
     initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
   endmodule