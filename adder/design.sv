 //Code your design here
module add(input clk,input reset, input a,input b,input c,output [1:0]sum,output carry);
  reg [1:0]temp1;
  reg temp2;
  always @(posedge clk or posedge reset) 
    if(reset)
       temp1 =0;
  else
    begin
    temp1 <= a ^ b ^ c;
      temp2 <= (a && b) |(b && c) | (c && a);
    end
   assign sum = temp1;
   assign carry = temp2;
  endmodule
