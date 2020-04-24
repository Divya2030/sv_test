module assertion_cov(intf_cnt intf);
  Feature_3 : cover property (@(posedge intf.clk)  (intf.dout !=0)  |-> intf.reset == 0 );
    endmodule