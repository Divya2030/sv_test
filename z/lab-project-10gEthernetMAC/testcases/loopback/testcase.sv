
program testcase(interface tcifdriver, interface tcifmonitor);

    env env0;
    int num_packet;

    initial begin
         env0=new(tcifdriver,tcifmonitor);
         num_packet=4;
         env0.run(num_packet);
         #100 $finish;
    end
    final begin
         int unsigned    num_pkts;
         int unsigned    num_errors;
         num_errors  =   env0.sb.error;
         $display("\nTESTCASE: ----------------- LOOPBACK -----------------------");
         $display("\nTESTCASE: ----------------- End Of Simulation -----------------");
         $display("TESTCASE: Number of mismatched packets :  %0d", num_errors);
         if ( num_errors==0 )
            $display("TESTCASE: ---------------------- NO BUG: TESTPASS -----------------------\n");
         else
            $display("TESTCASE: ---------------------- BUG Detected TESTFAIL-------------------\n");
    end

     
endprogram
   
