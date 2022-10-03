class scoreboard;
    
    mailbox drv2sb;
    mailbox mon2sb;

    packet pkt_from_drv;
    packet pkt_from_mon;

    coverage cov;

    bit error;
    
    static int tot_num_comp;
    static int num_bytes_comp;

    function new(
        input mailbox drv2sb,
        input mailbox mon2sb
        );

        this.drv2sb = drv2sb;
        this.mon2sb = mon2sb;
        
        cov = new();

        error = 1'b0;
    endfunction

    task compare();

        int i;
        int k;
        int last_bytes;

        drv2sb.get(pkt_from_drv);
        mon2sb.get(pkt_from_mon);
        
        tot_num_comp++;
        $display("----------------------------------------------------------------------------");
        $display("---------------------IS BUG DETECTED ? --------------------------------------");
        if ( pkt_from_drv.tx_count != pkt_from_mon.rx_count ) begin
            $display("---------------------------YES-----------------------------------------------");
            $display("YES: Packet length transmitted does not match packet length received.");
        end
        else begin $display("NO: Packet length transmitted matched packet length received.");
                   $display("---------------------------NO-----------------------------------------------");
        end


	if (pkt_from_drv.pkt_data[i] != pkt_from_mon.pkt_data[i]) begin
		$display("YES: Packet data mismatch. Location of error: packet #%0d, 8 byte section #%0d", tot_num_comp, i);
                error = 1'b1;
        end
        cov.collect_coverage(pkt_from_drv);
        $display("----------------------------------------------------------------------------");
         
        
    endtask

    function print();
        $display("----------------------------------------------");
        $display("SCOREBOARD RESULT");
        $display("----------------------------------------------");
        $display("Number of packets transmitted: %0d", pkt_from_drv.tx_count);
        $display("Number of packets received   : %0d", pkt_from_mon.rx_count);
        $display("Number of packets checked    : %0d", this.tot_num_comp);
        if (error)
            $display("NOT all packets received successfully.");
        else
            $display("All packets recieved sucessfully.");
        $display("----------------------------------------------\n");
    endfunction

endclass

