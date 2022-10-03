class coverage;

  packet    cov_packet;

  covergroup ethernet_cg;
    option.name = "Covergroup for 10GE MAC CORE";

    pkt_data_size      : coverpoint cov_packet.pkt_data.size()
                    {
                        bins undersize_pkt  = { [0:45] };
                        bins small_pkt      = { [46:256] };
                        bins medium_pkt     = { [257:1000] };
                        bins large_pkt      = { [1001:1500] };
                        bins oversize_pkt   = { [1501:9000] };
                    }
    ipg          : coverpoint cov_packet.ipg
                    {
                        bins zero_ipg_delay     = { 0 };
                        bins short_ipg_delay    = { [1:10] };
                        bins medim_ipg_delay    = { [11:45] };
                        bins large_ipg_delay    = { [46:$] };
                    }
  endgroup

  
  function new();
    ethernet_cg = new();
  endfunction : new


  task collect_coverage( input packet drv_pkt );
    this.cov_packet = drv_pkt;
    ethernet_cg.sample();
  endtask : collect_coverage

endclass

