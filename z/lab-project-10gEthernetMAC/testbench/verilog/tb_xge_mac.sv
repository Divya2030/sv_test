module testbench();

  bit         clk_156m25, clk_xgmii_rx, clk_xgmii_tx;
  bit         reset_156m25_n, reset_xgmii_rx_n, reset_xgmii_tx_n;
  logic         pkt_rx_ren, pkt_tx_eop, pkt_tx_sop, pkt_tx_val; 
  logic         wb_clk_i, wb_cyc_i, wb_rst_i, wb_stb_i, wb_we_i;
  logic [63:0]  pkt_tx_data, xgmii_rxd;
  logic [2:0]   pkt_tx_mod;
  logic [7:0]   wb_adr_i, xgmii_rxc;
  logic [31:0]  wb_dat_i;
  logic         pkt_rx_avail, pkt_rx_eop, pkt_rx_err, pkt_rx_sop, pkt_rx_val, pkt_tx_full;
  logic         wb_ack_o, wb_int_o;
  logic [63:0]  pkt_rx_data, xgmii_txd;
  logic [2:0]   pkt_rx_mod;
  logic [31:0]  wb_dat_o;
  logic [7:0]   xgmii_txc;


//---
// Clock generation and reset generation

initial begin
    clk_156m25 = 1'b0;
    clk_xgmii_rx = 1'b0;
    clk_xgmii_tx = 1'b0;

    forever begin
        #32000
        clk_156m25 = ~clk_156m25;
        clk_xgmii_rx = ~clk_xgmii_rx;
        clk_xgmii_tx = ~clk_xgmii_tx;
    end

end

initial begin
    reset_156m25_n      = 1'b0;
    reset_xgmii_rx_n    = 1'b0;
    reset_xgmii_tx_n    = 1'b0;
    wb_rst_i  =1'b1;

    #20000;
    reset_156m25_n      <= 1'b1;
    reset_xgmii_rx_n    <= 1'b1;
    reset_xgmii_tx_n    <= 1'b1;
    wb_rst_i            <= 1'b0;
end
             


xge_mac_interface     xgeif  (   
                                        .clk_156m25(clk_156m25),
                                        .clk_xgmii_rx(clk_xgmii_rx),
                                        .clk_xgmii_tx(clk_xgmii_tx),
                                        .wb_clk_i(wb_clk_i),
                                        .reset_156m25_n(reset_156m25_n),
                                        .reset_xgmii_rx_n(reset_xgmii_rx_n),
                                        .reset_xgmii_tx_n(reset_xgmii_tx_n),
                                        .wb_rst_i(wb_rst_i)
                                    );

  // DUT instantiated here
xge_mac   dut  ( // Outputs
                            .pkt_rx_avail       (xgeif.pkt_rx_avail),
                            .pkt_rx_data        (xgeif.pkt_rx_data),
                            .pkt_rx_eop         (xgeif.pkt_rx_eop),
                            .pkt_rx_err         (xgeif.pkt_rx_err),
                            .pkt_rx_mod         (xgeif.pkt_rx_mod),
                            .pkt_rx_sop         (xgeif.pkt_rx_sop),
                            .pkt_rx_val         (xgeif.pkt_rx_val),
                            .pkt_tx_full        (xgeif.pkt_tx_full),
                            .wb_ack_o           (xgeif.wb_ack_o),
                            .wb_dat_o           (xgeif.wb_dat_o),
                            .wb_int_o           (xgeif.wb_int_o),
                            .xgmii_txc          (xgeif.xgmii_txc),
                            .xgmii_txd          (xgeif.xgmii_txd),
                            // Inputs           
                            .clk_156m25         (xgeif.clk_156m25),
                            .clk_xgmii_rx       (xgeif.clk_xgmii_rx),
                            .clk_xgmii_tx       (xgeif.clk_xgmii_tx),
                            .pkt_rx_ren         (xgeif.pkt_rx_ren),
                            .pkt_tx_data        (xgeif.pkt_tx_data),
                            .pkt_tx_eop         (xgeif.pkt_tx_eop),
                            .pkt_tx_mod         (xgeif.pkt_tx_mod),
                            .pkt_tx_sop         (xgeif.pkt_tx_sop),
                            .pkt_tx_val         (xgeif.pkt_tx_val),
                            .reset_156m25_n     (xgeif.reset_156m25_n),
                            .reset_xgmii_rx_n   (xgeif.reset_xgmii_rx_n),
                            .reset_xgmii_tx_n   (xgeif.reset_xgmii_tx_n),
                            .wb_adr_i           (xgeif.wb_adr_i),
                            .wb_clk_i           (xgeif.wb_clk_i),
                            .wb_cyc_i           (xgeif.wb_cyc_i),
                            .wb_dat_i           (xgeif.wb_dat_i),
                            .wb_rst_i           (xgeif.wb_rst_i),
                            .wb_stb_i           (xgeif.wb_stb_i),
                            .wb_we_i            (xgeif.wb_we_i),
                            .xgmii_rxc          (xgeif.xgmii_rxc),
                            .xgmii_rxd          (xgeif.xgmii_rxd)
                          );

testcase  itestcase (xgeif.testcase_port,xgeif.testcase_port);

assign xgeif.xgmii_rxc = xgeif.xgmii_txc;
assign xgeif.xgmii_rxd = xgeif.xgmii_txd;

initial begin
     $vcdplusdeltacycleon();
     $vcdpluson();
end
endmodule

