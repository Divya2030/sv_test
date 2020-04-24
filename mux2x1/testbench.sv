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
  mux_if i_intf(clk,reset);
  
  //Testcase instance, interface handle is passed to test as an argument
  test t1(i_intf);
  
  //DUT instance, interface signals are connected to the DUT ports
  mux2x1 DUT (
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .in0(i_intf.in0),
    .in1(i_intf.in1),
    .sel(i_intf.sel),
    .out(i_intf.out)
   );
    
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule :top