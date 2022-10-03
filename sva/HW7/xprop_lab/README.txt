Goal : This lab demonstrates use of Formal tool to detect X prop issues

1. Design contains in file xp.v (module name queue) , it is a simple fifo
2. Create a top level wrapper that instantiates DUT two times.
	a) Attach inputs from both instances to same signals
	b) Check outputs cycle by cycle
3. Create a VC-Formal command script file to run this setup

Results:

1) Does the outputs from both instances mismatch?
2) Identify the root cause
3) Fix the design and run again ... Do you get expected results ...?
