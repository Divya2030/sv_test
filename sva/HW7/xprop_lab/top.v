module top
#(parameter DWIDTH = 32)
(
input clk, 
input rstn, 
input enq, 
input deq, 
input [DWIDTH-1:0] din, 
output [DWIDTH-1:0] dout, 
output [DWIDTH-1:0] dout2, 
output full, 
output full2,
output empty, 
output empty2
);

queue dut1(clk, rstn, enq, deq, din, dout, full, empty );

queue dut2(clk, rstn, enq, deq, din, dout2, full2, empty2);


assert_dout: assert property (@(posedge clk) disable iff (!rstn)  dout == dout2);

assert_full: assert property (@(posedge clk)disable iff (!rstn)  full == full2);

assert_empty: assert property (@(posedge clk) disable iff (!rstn) empty == empty2);

endmodule
 
