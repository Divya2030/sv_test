class monitor;
          scoreboard sb;
          virtual intf_cnt intf;

          function new(virtual intf_cnt intf,scoreboard sb);
               this.intf = intf;
               this.sb = sb;
          endfunction

          task check();
              forever
              @ (negedge intf.clk)
                if(sb.store != intf.dout) // Get expected value from scoreboard and compare with DUT output
                  $display(" * ERROR * DUT count is 0 :: SB count is 0 ", intf.dout,sb.store );
              else
                $display("           DUT count is 0 :: SB count is 0 ", intf.dout,sb.store );
          endtask
    endclass