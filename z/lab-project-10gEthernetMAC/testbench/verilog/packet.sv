class packet;

    rand logic [7:0] pkt_data[] ; 
    logic pkt_val;
    rand logic pkt_sop;
    rand logic pkt_eop;
    logic [2:0] pkt_mod;
    rand int pkt_length;
    int pkt_size;
    static int tx_count;
    static int rx_count;
    rand int ipg;

    constraint packet_length_reg {
        pkt_length inside {[64:100]};
    }
    constraint pkt_ipg {
      ipg inside {[30:50]};
    }

    constraint c_sop_eop {
      pkt_sop == 1;
      pkt_eop == 1;
    }

   // pkt_size =( pkt_length%8 ) ? pkt_length/8 + 1 : pkt_length/8;
    constraint C_payload_size {
      pkt_data.size() ==pkt_init(pkt_length);
    }
    
    function int pkt_init(int unsigned  length);
         pkt_init = length % 8?($ceil(length / 8)*8) + 8:length;
    endfunction    

    constraint solve_length_pkt_data { solve pkt_length before pkt_data; }
    function new();
    endfunction
   
    function print();
      int i=0;
      foreach (this.pkt_data[i]) begin
        $display("pkt data: %h",this.pkt_data[i]);
      end
    endfunction
endclass

