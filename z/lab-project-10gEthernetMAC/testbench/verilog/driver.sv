`include "timescale.v"
`include "defines.v"
class driver;
   
    
    virtual xge_mac_interface vi;

    mailbox drv2sb;

    packet pkt;

    function new(input virtual xge_mac_interface vif, input mailbox drv2sb);
        this.vi = vif;
        this.drv2sb = drv2sb;
        pkt = new();
    endfunction

    task send_packet();
        packet ethernet;
        ethernet = new pkt;
        assert(ethernet.randomize());
    
	begin
		$display("Transmit packet with length: %d", ethernet.pkt_length);
 
		@(posedge vi.clk_156m25);
		vi.pkt_tx_val <= 1'b1;

		for (int i = 0; i < ethernet.pkt_length; i = i+8) begin

		    vi.pkt_tx_sop = 1'b0;
		    vi.pkt_tx_eop = 1'b0;
		    vi.pkt_tx_mod = 2'b0;
		    if (i == 0) begin 
                       vi.pkt_tx_sop = ethernet.pkt_sop;
                        
                    end
                    else begin
                       vi.pkt_tx_sop = 1'b0;
                    end

		    if (i+8  >= ethernet.pkt_length) begin
			vi.pkt_tx_eop = ethernet.pkt_eop;
			vi.pkt_tx_mod = ethernet.pkt_length % 8;
		    end

		    vi.pkt_tx_data[`LANE7] = ethernet.pkt_data[i];
		    vi.pkt_tx_data[`LANE6] = ethernet.pkt_data[i+1];
		    vi.pkt_tx_data[`LANE5] = ethernet.pkt_data[i+2];
		    vi.pkt_tx_data[`LANE4] = ethernet.pkt_data[i+3];
		    vi.pkt_tx_data[`LANE3] = ethernet.pkt_data[i+4];
		    vi.pkt_tx_data[`LANE2] = ethernet.pkt_data[i+5];
		    vi.pkt_tx_data[`LANE1] = ethernet.pkt_data[i+6];
   		    vi.pkt_tx_data[`LANE0] = ethernet.pkt_data[i+7];
                    //$display("%h",vi.pkt_tx_data);

		    @(posedge vi.clk_156m25);

		end
		vi.pkt_tx_val = 1'b0;
		vi.pkt_tx_eop = 1'b0;
		vi.pkt_tx_sop = 1'b0;
		vi.pkt_tx_mod = 3'b0;
		vi.pkt_tx_data= 64'b0;
		//vi.pkt_rx_ren = 1'b0;
                repeat (ethernet.ipg) @(posedge vi.clk_156m25);
                drv2sb.put(ethernet);
		ethernet.tx_count = ethernet.tx_count + 1;
                $display("ipg: %d", ethernet.ipg);
                if (ethernet.ipg !=0) begin
                  #50000;
                end
	    end

    endtask


    task init();
        vi.wb_adr_i <= 8'b0;
        vi.wb_cyc_i <= 1'b0;
        vi.wb_dat_i <= 32'b0;
        vi.wb_stb_i <= 1'b0;
        vi.wb_we_i  <= 1'b0;


        vi.pkt_rx_ren <= 1'b0;
        vi.pkt_tx_data <= 64'b0;
        vi.pkt_tx_val <= 1'b0;
        vi.pkt_tx_sop <= 1'b0;
        vi.pkt_tx_eop <= 1'b0;
        vi.pkt_tx_mod <= 3'b0;


        @(posedge vi.clk_156m25);

    endtask


endclass

