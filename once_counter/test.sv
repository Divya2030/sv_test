`include "env.sv"
`include "interface.sv"
program testcase(intf_cnt intf);
         environment env;

         initial
         begin
           env= new(intf);
              env.drvr.reset();
           env.drvr.drive(40);
         end
    endprogram