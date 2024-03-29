interface xge_mac_interface (   input bit  clk_156m25,input bit clk_xgmii_rx,input bit clk_xgmii_tx,input bit wb_clk_i,input bit reset_156m25_n,input bit reset_xgmii_rx_n,input bit reset_xgmii_tx_n,input bit wb_rst_i);

  logic         pkt_rx_ren, pkt_tx_eop, pkt_tx_sop, pkt_tx_val;
  logic         wb_cyc_i, wb_stb_i, wb_we_i, wb_ack_o, wb_int_o;
  logic         pkt_rx_avail, pkt_rx_eop, pkt_rx_err, pkt_rx_sop, pkt_rx_val, pkt_tx_full;
  logic [63:0]  pkt_tx_data, xgmii_rxd, pkt_rx_data, xgmii_txd;
  logic [31:0]  wb_dat_i, wb_dat_o;
  logic [7:0]   wb_adr_i, xgmii_rxc, xgmii_txc;
  logic [2:0]   pkt_tx_mod, pkt_rx_mod;

              
  default clocking cb @(posedge clk_156m25);
    input   #1  pkt_rx_avail;
    input   #1  pkt_rx_data;
    input   #1  pkt_rx_eop;
    input   #1  pkt_rx_err;
    input   #1  pkt_rx_mod;
    input   #1  pkt_rx_sop;
    input   #1  pkt_rx_val;
    input   #1  pkt_tx_full;
    input   #1  wb_ack_o;
    input   #1  wb_dat_o;
    input   #1  wb_int_o;
    input   #1  xgmii_txc;
    input   #1  xgmii_txd;
    output  #1  pkt_rx_ren;
    output  #1  pkt_tx_data;
    output  #1  pkt_tx_eop;
    output  #1  pkt_tx_mod;
    output  #1  pkt_tx_sop;
    output  #1  pkt_tx_val;
    output  #1  wb_adr_i;
    output  #1  wb_cyc_i;
    output  #1  wb_dat_i;
    output  #1  wb_stb_i;
    output  #1  wb_we_i;
    output  #1  xgmii_rxc;
    output  #1  xgmii_rxd;
  endclocking
  
   
  modport testcase_port ( clocking cb );



endinterface

