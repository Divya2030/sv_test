
program testcase(interface tcifdriver, interface tcifmonitor);

    env env0;
    int num_packet;
    
    class smallpacket extends packet;
      constraint c_sop_eop {
        pkt_sop dist { 0:=10, 1:=90 };
        pkt_eop == 1;
      }
    endclass
    smallpacket spkt;

    initial begin
         env0=new(tcifdriver,tcifmonitor);
         num_packet=4;
         spkt=new();
         env0.drv.pkt=spkt;
         env0.run(num_packet);
         #100 $finish;

    end

    final begin
         int unsigned    num_pkts;
         int unsigned    num_errors;
         num_errors  =   env0.sb.error;
         $display("\nTESTCASE: ----------------- NEGATIVE TESTCASE -----------------------");
         $display("\nTESTCASE: ----------------- MISSING SOP -----------------------");
         $display("\nTESTCASE: ----------------- End Of Simulation -----------------");
         $display("TESTCASE: Number of mismatched packets :  %0d", num_errors);
         if ( num_errors==0 )
            $display("TESTCASE: ---------------------- NO BUG: TESTPASS -----------------------\n");
         else
            $display("TESTCASE: ---------------------- BUG Detected TESTFAIL-------------------\n");
    end

     
endprogram
   
