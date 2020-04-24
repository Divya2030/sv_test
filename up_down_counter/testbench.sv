// Code your testbench here
// or browse Examples
`include "test.sv"
`include "interface.sv"
module top;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    reset=1;
    
    #5 reset=0;
  end
  
  count_if i_intf(clk,reset);
  
 upordown_counter dut(.clk(i_intf.clk),.reset(i_intf.reset),.UpOrDown(i_intf.UpOrDown),.count(i_intf.count));
  
  test t1(i_intf);
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
    
  