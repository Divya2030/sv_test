module dff(clk,reset,din,dout);
input clk,reset,din;
output dout;
logic dout;

always@(posedge clk,negedge reset)
if(!reset)
dout <= 0;
else
dout <= din;
endmodule