help:
	@echo "======================================================================";
	@echo "Usage:";
	@echo "  > make regress          - run all tests & generate summary";
	@echo "  > make summary          - generate summary";
	@echo "  > make coverage         - run regress and generate coverage report";
	@echo "  > make test_index       - run individual test [see list below]";
	@echo "  > make clean            - run CLEAN script";
	@echo "";
	@echo "    -----------------------------------------";
	@echo "    test_index      test_name";
	@echo "    -----------------------------------------";
	@echo "    t1              loopback";
	@echo "    t2              missing_eop";
	@echo "    t3              missing_sop";
	@echo "    t4              oversize_packet";
	@echo "    t5              undersize_packet";
	@echo "    t6              zero_ipg_packet";
	@echo "======================================================================";

# Makefile variables
#####################
VCS_CMD_RAND    = vcs -full64 +vcs+lic+wait -sverilog -R -override_timescale=1ps/1ps +ntb_random_seed_automatic -debug_access+all
LOGS_DIR     = logs
COV_OPTIONS     = -cm line+cond+branch+fsm+tgl -cm path -lca -cm_log ./coverage.log -cm_dir ./COVERAGE
DESIGN_FILES    = ../rtl/verilog/*.v +incdir+../rtl/include
TESTBENCH_FILES = ../testbench/verilog/xge_mac_interface.sv ../testbench/verilog/tb_xge_mac.sv  ../testbench/verilog/packet.sv ../testbench/verilog/driver.sv ../testbench/verilog/monitor.sv  ../testbench/verilog/coverage.sv ../testbench/verilog/scoreboard.sv ../testbench/verilog/env.sv


# Makefile targets
#####################
regress: all_tests summary

all_tests: t1 t2 t3 t4 t5 t6

# Bogus targets -> map to real testnames
t1:loopback
t2:missing_eop
t3:missing_sop
t4:oversize_packet
t5:undersize_packet
t6:zero_ipg_packet

loopback:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

missing_eop:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

missing_sop:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

oversize_packet:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

undersize_packet:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

zero_ipg_packet:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ../testcases/$@/testcase.sv -l ${LOGS_DIR}/$@.log

coverage:logdir
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/loopback/testcase.sv -l ${LOGS_DIR}/$@.log
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/missing_eop/testcase.sv -l ${LOGS_DIR}/$@.log
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/missing_sop/testcase.sv -l ${LOGS_DIR}/$@.log
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/oversize_packet/testcase.sv -l ${LOGS_DIR}/$@.log
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/undersize_packet/testcase.sv -l ${LOGS_DIR}/$@.log
	${VCS_CMD_RAND} ${DESIGN_FILES} ${TESTBENCH_FILES} ${COV_OPTIONS} ../testcases/zero_ipg_packet/testcase.sv -l ${LOGS_DIR}/$@.log
	urg -lca -dir ./COVERAGE.vdb 

logdir: 
	-mkdir ${LOGS_DIR}
summary:
	perl gen_summary.pl | tee summary.log

clean:
	rm -rf ../testcases/*/vcs.log \
	csrc \
	simv* \
	summary.log \
	ucli.key \
	vcdplus.vpd \
	*DVE* \
	*INCA* \
	transcript \
	work \
	vc_hdrs.h \
	coverage.log \
	COVERAGE.vdb \
	urgReport

