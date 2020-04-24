//`include "scoreboard.sv"
`include "driver.sv"
`include "monitor.sv"

class environment;
           driver drvr;
           scoreboard sb;
           monitor mntr;
           virtual intf_cnt intf;

           function new(virtual intf_cnt intf);
                 this.intf = intf;
                 sb = new();
                 drvr = new(intf,sb);
                 mntr = new(intf,sb);
                 fork
                     mntr.check();
                 join_none
           endfunction

     endclass