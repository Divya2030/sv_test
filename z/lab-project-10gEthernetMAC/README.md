10GE MAC Core Verification 

In this Project, Design and Verification of 10GE MAC Core is done using System Verilog
OOP Testbench Environment. The testbench environment includes classes system verilog
packet class, driver class, monitor class, scoreboard class, coverage class and environment class. Virtual
interface to connect OOP testbench component class. Testcases are written in the program block, constraints are defined for each testcase. Synopsys VCS compiler is used to
run the tests, and synosys dve is used to generate the waveform. Coverage reports are
generated in html format in urgReport directory.
```
# Steps to run the tests:
$ cd scripts
$ make regress   # run all testcases
$ make coverage    # run all testcases with coverage enable
$ firefox urgReport/dashboard.html   # to see html coverage reports
$ dve -vpd vcdplus.vpd & to see the waveform
# To run stand alone testcases
# make -help to see testcase handle
$ make t1  # loopback
$ make t2  # missing_eop  //error testcase will fail please terminate if eop is zero and hangs
$ make t3  # missing_sop   //error testcase will fail please terminate if sop is zero and hangs
$ make t4  # oversize_packet
$ make t5  # undersize_packet
$ make t6  # zero_ipg_packet

$ TX_RX.vcdplus.vpd.tcl # load session in verdi waveform
```


Directory Structure:
```bash
├── doc
├── rtl
│   ├── auto_verilog.sh
│   ├── include
│   │   ├── CRC32_D64.v
│   │   ├── CRC32_D8.v
│   │   ├── defines.v
│   │   ├── timescale.v
│   │   └── utils.v
│   └── verilog
│       ├── fault_sm.v
│       ├── generic_fifo_ctrl.v
│       ├── generic_fifo.v
│       ├── generic_mem_medium.v
│       ├── generic_mem_small.v
│       ├── meta_sync_single.v
│       ├── meta_sync.v
│       ├── rx_data_fifo.v
│       ├── rx_dequeue.v
│       ├── rx_enqueue.v
│       ├── rx_hold_fifo.v
│       ├── sync_clk_core.v
│       ├── sync_clk_wb.v
│       ├── sync_clk_xgmii_tx.v
│       ├── tx_data_fifo.v
│       ├── tx_dequeue.v
│       ├── tx_enqueue.v
│       ├── tx_hold_fifo.v
│       ├── wishbone_if.v
│       └── xge_mac.v
├── scripts
│   ├── 1
│   ├── CLEAN
│   ├── gen_summary.pl
│   ├── logs
│   │   ├── coverage.log
│   │   ├── loopback.log
│   │   ├── missing_eop.log
│   │   ├── missing_sop.log
│   │   ├── oversize_packet.log
│   │   ├── undersize_packet.log
│   │   └── zero_ipg_packet.log
│   ├── Makefile
│   ├── pkt_rx_wave.vcdplus.vpd.tcl
│   ├── pkt_tx_wave.vcdplus.vpd.tcl
│   ├── README
│   ├── TX_RX.vcdplus.vpd.tcl
│   ├── xgmii_rx.vcdplus.vpd.tcl
│   └── xgmii_tx.vcdplus.vpd.tcl
├── sim
│   └── verilog
│       ├── CLEAN
│       ├── runsim
│       ├── runsim.coverage
│       ├── TX_RX.vcdplus.vpd.tcl
│       └── XGMII_TX_RX.vcdplus.vpd.tcl
├── testbench
│   └── verilog
│       ├── coverage.sv
│       ├── driver.sv
│       ├── env.sv
│       ├── monitor.sv
│       ├── packets_tx.txt
│       ├── packet.sv
│       ├── scoreboard.sv
│       ├── tb_xge_mac_old.sv
│       ├── tb_xge_mac.sv
│       └── xge_mac_interface.sv
└── testcases
    ├── loopback
    │   └── testcase.sv
    ├── missing_eop
    │   └── testcase.sv
    ├── missing_sop
    │   └── testcase.sv
    ├── oversize_packet
    │   └── testcase.sv
    ├── undersize_packet
    │   └── testcase.sv
    └── zero_ipg_packet
        └── testcase.sv

17 directories, 64 files
```


