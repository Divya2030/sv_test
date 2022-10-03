
#tool setup variables
 set_app_var fml_mode_on true
 set_fml_appmode AEP
 set_fml_appmode FPV
 #set_fml_appmode COV
 set_fml_var fml_vacuity_on true
 set_fml_var fml_witness_on true

# Read design file
# # fill this section
 analyze -format sverilog -vcs { top.v xp.v -assert svaext}
 #elaborate top -sva -aep x_assign -cov all
 elaborate top -sva -aep x_assign 


#
# # Declare clock/reset
# # fill this section
 create_clock clk -period 1000
 create_reset rstn -low
#
# # Save initial state
 sim_run -stable
 sim_save_reset
#
# ##Command to actually run the Formal
 ## check_fv
report_fv -list > results_xprop.txt
#
