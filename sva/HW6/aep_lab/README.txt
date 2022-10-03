AEP Homework instructions:

1. Create a new project file for AEP
   (Hint: use text editor)

2. Enter design information: 
	Top HDL name: aep_top
	vcs compile time option: -f filelist

3. Enter clock/reset info:
	ports:  clk	clock	period 1000
		rst	reset	active high

4. Elaborate with aep enabled

5. Start the run 
   vcf> check_fv

6. Results 
   vcf> report_fv -list > results_aep.txt

NOTE: Refer to FSM example for sample tcl script, you can also get in-tool help using "help" command
