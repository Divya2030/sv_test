// Code your testbench here
// or browse Examples
`include "test.sv"
`include "interface.sv"
module top;
  
  //clock and reset signal declaration
  bit clk;
  bit reset;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  add_if i_intf(clk,reset);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(i_intf);
  
  //DUT instance, interface signals are connected to the DUT ports
  add DUT (
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .a(i_intf.a),
    .b(i_intf.b),
    .c(i_intf.c),
    .sum(i_intf.sum),
    .carry(i_intf.carry)
   );
    
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule :top