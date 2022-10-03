class env;
   
    virtual xge_mac_interface vi;
    virtual xge_mac_interface mi;
   
    mailbox drv2sb;
    mailbox mon2sb;

    driver drv;
    monitor mon;
    scoreboard sb;


    function new(input virtual xge_mac_interface vif,input virtual xge_mac_interface mif);
        this.vi = vif;
        this.mi = mif;

        drv2sb = new();
        mon2sb = new();

        drv = new(vi, drv2sb);
        mon = new(mi, mon2sb);

        sb = new(drv2sb, mon2sb);
    endfunction
    
    task run(int number_of_packets=4);
        int i; 

        $display("\nSending %0d packets...", number_of_packets);
        fork
          begin
             drv.init();
	     for (i = 0; i < number_of_packets; i++) begin
               drv.randomize();
	       drv.send_packet();
	     end
	  end
          //begin
          mon.collect_packet(number_of_packets);
	 // end
        join
        for (i = 0; i < number_of_packets; i++) begin
            sb.compare();   
        end

        sb.print();
  
        @(posedge vi.clk_156m25);
        $finish;
    
    endtask
    
endclass

