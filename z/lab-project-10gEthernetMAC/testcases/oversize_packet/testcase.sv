
program testcase(interface tcifdriver, interface tcifmonitor);

    env env0;
    int num_packet;
 
    class smallpacket extends packet;
      constraint packet_length_reg { pkt_length inside {[700:1500]}; 
      }
    endclass
    smallpacket spkt;
    initial begin
         env0=new(tcifdriver,tcifmonitor);
         spkt=new();
         env0.drv.pkt=spkt;
         num_packet=4;
         #500000; 
         env0.run(num_packet);
         #90000000 $finish;
    end

    final begin
         int unsigned    num_pkts;
         int unsigned    num_errors;
         num_errors  =   env0.sb.error;
         $display("\nTESTCASE: ----------------- OVERSIZE PACKET -----------------------");
         $display("\nTESTCASE: ----------------- End Of Simulation -----------------");
         $display("TESTCASE: Number of mismatched packets :  %0d", num_errors);
         if ( num_errors==0 )
            $display("TESTCASE: ---------------------- NO BUG: TESTPASS -----------------------\n");
         else
            $display("TESTCASE: ---------------------- BUG Detected TESTFAIL-------------------\n");
    end
 
endprogram
   
