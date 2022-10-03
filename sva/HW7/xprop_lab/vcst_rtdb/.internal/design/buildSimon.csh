#!/bin/csh -f
setenv VCS_HOME /usr/synopsys/vc_static/S-2021.09-SP1/vcs-mx
setenv VC_STATIC_HOME /usr/synopsys/vc_static/S-2021.09-SP1
setenv SYNOPSYS_SIM_SETUP /home/sv11108/HW7/xprop_lab/vcst_rtdb/.internal/design/synopsys_sim.setup

$VCS_HOME/bin/vlogan  -kdb=common_elab /home/sv11108/HW7/xprop_lab/vcst_rtdb/.internal/design/undef_vcs.v -Xvd_opts=-silent,+disable_message+C00373,-ssy,-ssv,-ssz -file /home/sv11108/HW7/xprop_lab/vcst_rtdb/.internal/design/analyzeCmd1 -Xufe=parallel:incrdump  -full64 

$VCS_HOME/bin/vcs -file /home/sv11108/HW7/xprop_lab/vcst_rtdb/.internal/design/elaborateCmd -Xvcstatic_extns=0x4  -Xvcstatic_extns=0x1000  -Xvcstatic_extns=0x100  +warn=noSM_CCE  -kdb=common_elab  -Xufe=parallel:incrdump  +warn=noKDB-ELAB-E  -Xverdi_elab_opts=-saveLevel  -verdi_opts "-logdir /home/sv11108/HW7/xprop_lab/vcst_rtdb/verdi/elabcomLog " -Xvd_opts=,-ssy,-ssv,-ssz,-silent,+disable_message+C00373, -full64 
