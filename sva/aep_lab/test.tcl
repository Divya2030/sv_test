# Tool setup variables
set_fml_appmode AEP
set_app_var fml_mode_on true

#Read design file
# fill this section
analyze -format sverilog -vcs {-f filelist -assert svaext }
#
# #4. Elaborate with aep enabled
elaborate aep_top -aep -sva -cov all
#
# #3. Enter clock/reset info:
# # Declare clock/reset
# # fill this section
create_clock clk -period 1000
create_reset rst -high
#
# #5. Start the run
sim_run -stable
sim_save_reset
# #check_fv
#
# #6. Results
# # Save initial state
report_cov -verbose
report_fv -list > results_aep.txt
