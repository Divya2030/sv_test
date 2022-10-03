verdiSetActWin -dock widgetDock_<Message>
verdiWindowWorkMode -win $_Verdi_1 -formalVerification
verdiDockWidgetDisplay -dock windowDock_vcstConsole_2
srcSetPreference -vcstOpts \
           {-demo -file test.tcl -prompt vcf -fmode _default -new_verdi_comm}
verdiSetActWin -win $_vcstConsole_2
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "595"
verdiWindowResize -win $_Verdi_1 "0" "0" "1252" "595"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "0" "0" "1254" "597"
verdiSetActWin -win $_vcstConsole_2
schSetVCSTDelimiter -VHDLGenDelim "."
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/design/aep_top.exe" \
           -args
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/design/aep_top.exe.daidir"
srcSetPreference -tabNum 16
srcSetSnipSignal -reset
srcSetSnipSignal -reset
debLoadUserDefinedFile \
           /home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"aep_top/rst\" text=\"C:0\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
schSetPreference -displayAbstractSrc on
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
verdiRunVcstCmd view_trace -property {aep_top.aep_bounds.bounds_check_0} \
           -composite

wvCreateWindow
srcSetPreference -annotate on
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/formal/fpId0/trace_0.xml.replay.fsdb.vf}
wvAddGroup -win $_nWave3 AEP-Property
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("AEP-Property" 0)}
wvAddSignal -win $_nWave3 "/aep_top/aep_bounds/bounds_check_0"
wvSetPosition -win $_nWave3 {("AEP-Property" 0)}
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvAddGroup -win $_nWave3 Support-Signals
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvAddSignal -win $_nWave3 "/aep_top/aep_bounds/sigB\[2:0\]" "/aep_top/clk"
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvAddGroup -win $_nWave3 Constant-Inputs
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvAddSignal -win $_nWave3 "/aep_top/din\[1:0\]"
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 1)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvCollapseGroup -win $_nWave3 "Constant-Inputs"
wvGoToGroup -win $_nWave3 "AEP-Property"
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvSetMarker -win $_nWave3 -name "Rst-End" 1000.000000 ID_PURPLE5 line_solid
wvAddCompressTimeRange -win $_nWave3 0.000000 1000.000000
wvExpandCompressTimeRange -win $_nWave3 0 1000 left
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
srcShowDefine -incrSearch aep_top.aep_bounds.bounds_check_0
wvZoomAll -win $_nWave3
verdiSetActWin -dock widgetDock_VCF:GoalList
verdiRunVcstCmd view_trace -property {aep_top.aep_parallel.parallel_case_0} \
           -composite

wvCloseFile -win $_nWave3
wvDeleteCompressTimeRange -win $_nWave3 all
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/formal/fpId0/trace_7.xml.replay.fsdb.vf}
wvAddGroup -win $_nWave3 AEP-Property
wvSetPosition -win $_nWave3 {("G1" 0)}
wvSetPosition -win $_nWave3 {("AEP-Property" 0)}
wvAddSignal -win $_nWave3 "/aep_top/aep_parallel/parallel_case_0"
wvSetPosition -win $_nWave3 {("AEP-Property" 0)}
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvAddGroup -win $_nWave3 Support-Signals
wvSetPosition -win $_nWave3 {("AEP-Property" 1)}
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvAddSignal -win $_nWave3 "/aep_top/aep_parallel/din\[1:0\]" "/aep_top/clk"
wvSetPosition -win $_nWave3 {("Support-Signals" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvAddGroup -win $_nWave3 Most-Toggled-Registers
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 0)}
wvAddSignal -win $_nWave3 "/aep_top/din_d\[1:0\]"
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 0)}
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 1)}
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 0)}
wvCollapseGroup -win $_nWave3 "Most-Toggled-Registers"
wvAddGroup -win $_nWave3 Constant-Inputs
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 0)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvAddSignal -win $_nWave3 "/aep_top/din\[1:0\]" "/aep_top/rst"
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 2)}
wvSetPosition -win $_nWave3 {("Constant-Inputs" 0)}
wvCollapseGroup -win $_nWave3 "Constant-Inputs"
wvGoToGroup -win $_nWave3 "AEP-Property"
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
wvAddCompressTimeRange -win $_nWave3 0.000000 1000.000000
wvExpandCompressTimeRange -win $_nWave3 0 1000 left
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("Most-Toggled-Registers" 0)}
wvSetPosition -win $_nWave3 {("Support-Signals" 2)}
srcShowDefine -incrSearch aep_top.aep_parallel.parallel_case_0
wvZoomAll -win $_nWave3
debExit
