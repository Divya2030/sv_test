// Code your design here
module mux2x1(input clk,input reset,input in0,input in1,input sel,output out);
  reg temp;
  always@(posedge clk)
    if(reset)
      temp=0;
  else
    begin
  assign temp = sel? in1: in0;
    end
  assign out =temp;
  
  
endmodule