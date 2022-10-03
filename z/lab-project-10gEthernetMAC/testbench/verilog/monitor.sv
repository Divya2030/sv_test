class monitor;

    virtual xge_mac_interface mi;

    mailbox mon2sb;

    packet pkt;

    int done;
    int i;
    function new(input virtual xge_mac_interface mi, input mailbox mon2sb);
        this.mi = mi;
        this.mon2sb = mon2sb;
        pkt =new();
    endfunction


    task collect_packet(input int num_pkt_sent);
        forever begin
            
            @(posedge mi.clk_156m25);
            
            if (mi.pkt_rx_avail) begin
		packet rcvpkt;
                rcvpkt = new pkt;
                //int done;
                    begin
                        done = 0;
			mi.pkt_rx_ren <= 1'b1;
			@(posedge mi.clk_156m25);
			while (!done) begin
			    if (mi.pkt_rx_val) begin
				    if (mi.pkt_rx_sop) begin
					    $display("\n\n------------------------");
					    $display("Received Packet");
					    $display("------------------------");
				    end
                                    $display("%x", mi.pkt_rx_data);
                                    rcvpkt.pkt_data[i]   = mi.pkt_rx_data[`LANE7];
				    rcvpkt.pkt_data[i+1] = mi.pkt_rx_data[`LANE6];
				    rcvpkt.pkt_data[i+2] = mi.pkt_rx_data[`LANE5];
				    rcvpkt.pkt_data[i+3] = mi.pkt_rx_data[`LANE4];
				    rcvpkt.pkt_data[i+4] = mi.pkt_rx_data[`LANE3];
				    rcvpkt.pkt_data[i+5] = mi.pkt_rx_data[`LANE2];
				    rcvpkt.pkt_data[i+6] = mi.pkt_rx_data[`LANE1];
				    rcvpkt.pkt_data[i+7] = mi.pkt_rx_data[`LANE0];
				    if (mi.pkt_rx_eop) begin
                                       done <=1;
                                       mi.pkt_rx_ren <= 1'b0;
				    end
                                    if (mi.pkt_rx_eop) begin
                                       $display("------------------------\n\n");
                                    end
                                    i=i+8;
			    end
                            @(posedge mi.clk_156m25);
			end
                        mon2sb.put(rcvpkt);
                        rcvpkt.rx_count = rcvpkt.rx_count + 1;
                    end

                  
                if (num_pkt_sent == rcvpkt.rx_count) begin
                    break;
                end
                //else begin break; end
                

            end
            @(posedge mi.clk_156m25);
           // if (!mi.pkt_rx_avail) begin
             //   break;
           // end

        end
        
 
    endtask
	
endclass
