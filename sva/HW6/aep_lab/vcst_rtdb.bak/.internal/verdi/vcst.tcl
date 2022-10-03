## VerdiPlay
source ./verdi_vcst.tcl
verdiVcstResizeTopWin
verdiDockWidgetSetCurTab -dock windowDock_vcstConsole_2
::vcst::creatInstAction
::vcst::createAnalyzerAction
::vcst::creatResetLayoutAction
::vcst::creatAssertAnalyzerAction
set ::vcst::EnableUDWin 0
qwConfig -type nWave -cmds [list {qwAddToolBarGroup -group "UDWinGroup"} {qwAddToolBarGroup -group "AssertAnalyzer"}]
srcSetOptions -lockActView on
source /usr/synopsys/vc_static/S-2021.09-SP1/auxx/monet/tcl/menu.tcl

set ::vcst::_compositeTrace {1}
verdiVcstSyncMsgColor -errorColor "default_red" -warningColor "default_none" -infoColor "default_none"
verdiSetRCValue -section appSetting -key font -value {Bitstream Vera Sans(11)};
verdiSetPrefEnv -monoFontSize "11"
setStyleFvProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
setStyleFvGoalProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
verdiSetFont -font "Bitstream Vera Sans" -size "11"
verdiVcstOnPropSelectionChanged -strNum 0 -propList {}
verdiVcstSetAppmode -mode AEP -fromVcst
verdiVcstCheckFv -active -taskName AEP
verdiVcstOnPropSelectionChanged -strNum 0 -propList {}
verdiVcstDesignLoaded
set ::vcst::_fml_max_proof_depth {-1};set ::vcst::_fml_max_time {12H};catch {verdiVcstOnFmlVarChanged -key {fml_effort} -value {default}}
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList
verdiAboutDlg -banner {
VC Static

Version S-2021.09-SP1 for linux64 - Nov 26, 2021

Copyright (c) 2010 - 2021 Synopsys, Inc.
}
verdiSetStatusMsg -win Verdi_1 -color red { Design import... cross probing not ready }
set ::vcst::_top "aep_top"
set ::vcst::_elab ""
set ::vcst::_elabOpts {}
set ::vcst::_rtdbDir {/home/sv11108/HW6/aep_lab/vcst_rtdb}
set ::vcst::_hiddenDir {.internal}
set ::vcst::_masterMode true
set ::vcst::_workLib "work"
set ::vcst::_upfOpts " -upf "
set ::vcst::_enableKdb "true"
set ::vcst::_simBinPath "aep_top.exe"
set ::vcst::_goldenUpfConfig {}
set ::vcst::_nldmNschema {false}
set ::vcst::_kdbAlias {false}
set ::vcst::_covDut {}
set ::vcst::_splitbus {false}
set ::vcst::_enableVerdiLog {1}
set ::vcst::_fml_max_proof_depth {-1}
set ::vcst::_smartLoad {true}
set ::vcst::_compositeTrace {1}
set ::vcst::_strategyFilePath {}
set ::vcst::_enableVnrWriteKdb {false}
set ::vcst::_bIsFormalFlow {true}
set ::vcst::_diucFlow {false}
set ::vcst::_libArgs ""
set ::vcst::_seqXmlFile ""
schSetVCSTDelimiter -VHDLGenDelim "."
schSetPreference -turboLibs {} -turboLibPaths {}
verdiSetPrefEnv -bSpecifyWindowTitleForDockContainer off
paSetPreference -brightenPowerColor on
schSetPreference -showPassThroughNet on
paSetPreference -AnnotateSignal off
paSetPreference -highlightPowerObject off
srcAssertSetOpt -addSigToWave 0 -addSigWithExpGrp 1 -maskWave 0 -ShowCycleInfo 1
verdiRunVcst -on
schSetVCSTDelimiter -hierDelim .
set ::vcst::_vcstAppHierDelim "."
srcSetXpropOption "tmerge"
set ::vcst::_powerDbDir ""
set ::vcst::_bRestore ""
verdiDockWidgetFix -dock widgetDock_VCF:GoalList
::vcst::loadMainWin "0"
verdiDockWidgetUnfix -dock widgetDock_VCF:GoalList

setStyleFvProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
setStyleFvGoalProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
verdiSetFont -font "Bitstream Vera Sans" -size "11"
verdiSetPrefEnv -monoFontSize "11"
verdiVcstEnableAppMode -enable FRV

verdiRunVcstCmd "action aaVerdiWaitAnnotation -trigger
" -no_wait
verdiRunVcstCmd "action aaMonetSetReuseWave -data \{[verdiGetRCValue -section appSetting -key reuseWave]\}
" -no_wait
verdiSetStatusMsg -win Verdi_1 -color black { Design import ready }
verdiGetVcstCmdResult -xmlstr {<Command name="action" received="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" status="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" received="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" status="1"></Command>}

srcSetPreference -tabNum 16
verdiSetPrefEnv -bDockNewWindowInContainerWhenFindSameType "off"
set ::vcst::_bRestore ""
verdiLayoutFreeze -off
verdiToolBar -rm toolbarHB_TOGGLE_PANEL toolbarHB_EMULATION_PANEL toolbarHB_PRODTYPE_PANEL UVM_AWARE_DEBUG AMS_CONFIG_TOOLBAR NOVAS_TBBR_INTERACTIVEVIEW_PANEL NOVAS_TBBR_DEBUG_REWIND_COMMAND NOVAS_TBBR_DEBUG_REWIND_UNDO_REDO_COMMAND NOVAS_TBBR_DEBUG_REVERSE_COMMAND NOVAS_TBBR_DEBUG_VSIM_COMMAND NOVAS_EMULATION_DEBUG_COMMAND CVG_CER_PANEL
qComplexitySyncScope {aep_top}
qComplexitySyncScope {aep_top}
verdiVcstSetSviPid -pid 1554
verdiSetRCValue -section appSetting -key verdiFirstMode -value 1
verdiSetRCValue -section appSetting -key vcstVersion -value S-2021.09-SP1
verdiVcstDesignLoaded
verdiGetVcstCmdResult -xmlstr {<Command name="sim_run" status="1" />}
verdiGetVcstCmdResult -xmlstr {<Command name="sim_save_reset" status="1" />}
report_fv_complexity -silent -sim_save_reset
verdiLayoutFreeze -off
::vcst::showDebugViews -1 false false setupSource
verdiWindowMoveDockTab -win Verdi_1 widgetDock_VCF:Shell widgetDock_VCF:GoalList widgetDock_<Message>
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList

verdiDockWidgetSetCurTab -dock widgetDock_VCF:TaskList
verdiVcstSetAppmode -mode AEP -fromVcst
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
srcSetSnipSignal -reset
report_fv_complexity -silent
vcstPropertyDensityShow -silent abstraction
srcSetSnipSignal -file {/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/verdi/snip_signals.list}
report_fv_complexity -silent
vcstPropertyDensityShow -silent abstraction
srcSetBlackbox   -delim {.}
srcSetGlassbox  -delim {.}
srcSetSnipSignal -reset
report_fv_complexity -silent
vcstPropertyDensityShow -silent abstraction
srcSetSnipSignal -file {/home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/verdi/snip_signals.list}
report_fv_complexity -silent
vcstPropertyDensityShow -silent abstraction
verdiSetRCValue -section appSetting -key conSize -value {PROPERTY_CLASS,100:PROPERTY_CLOCK,100:PROPERTY_EXPRESSION,100:PROPERTY_ID,100:PROPERTY_INSTANCE,100:PROPERTY_LANGUAGE,100:PROPERTY_LOCATION,100:PROPERTY_NAME,100:PROPERTY_SCOPE,100:PROPERTY_SIGNALS,100:PROPERTY_SVA_TYPE,100:PROPERTY_TYPE,100:PROPERTY_USAGE,100:PROPERTY_VACUITY,100:PROPERTY_WITNESS,100:};
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiVcstConstantReport -xmlFile /home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/verdi/constant.xml 
schSetPreference -displayAbstractSrc on 
verdiVcstCheckFv -taskName AEP
vcstRunCovCmd -async gui_vcst_set_parameters -is_running true
receiveFvProgress /home/sv11108/HW6/aep_lab/vcst_rtdb/.internal/verdi/gridUsage.xml0
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiGetVcstCmdResult -xmlstr {<Command name="check_fv" status="1" />}
verdiVcstCheckFv -taskName AEP
vcstRunCovCmd -async gui_vcst_set_parameters -is_running false
verdiVcstOnPropSelectionChanged -strNum 1 -propList {aep_top.aep_bounds.bounds_check_0}
verdiSetStatusMsg -win $_Verdi_1 -2nd "Preparing FSDB..."
verdiGetVcstCmdResult -xmlstr {<Command name="view_trace" status="1" />}
verdiSetStatusMsg -win $_Verdi_1 -2nd "FSDB is ready, Waveform loading..."
sysWarnEnable -disable; set ::vcst::sysWarnEnable 0
verdiLayoutFreeze -off
set ::vcst::_curWaveVw [wvCreateWindow]
srcSetPreference -annotate on
verdiToolBar -win $_Verdi_1 -toolbar toolBarFormalVerification -moveToBf HB_BA_COMMAND_PANEL
set ::vcst::_fsdb $::vcst::_rtdbDir/.internal/formal/fpId0/trace_0.xml.replay.fsdb.vf;
expPropVcstDataUpdated -initFSDB $::vcst::_fsdb;
::vcst::wvOpenFsdb $::vcst::_curWaveVw $::vcst::_fsdb
verdiVcstFsdbAppMode -fsdb $::vcst::_fsdb -AppMode AEP
set ::vcst::_propClass {aep}
set ::vcst::_propLoc {rtl/aep_bounds.v:12}
set ::vcst::_propType {bounds_check}
set ::vcst::_propExpr {memA[sigB]}
set ::vcst::_sva {aep_top.aep_bounds.bounds_check_0}
verdiDockWidgetHide -dock widgetDock_Analyzer
::vcst::updatePropertyMap

set ::vcst::traceTypeMap($::vcst::actualFsdb) property

wvAddGroup -win $::vcst::_curWaveVw {AEP-Property};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "AEP-Property" {aep_top.aep_bounds.bounds_check_0} };
wvAddGroup -win $::vcst::_curWaveVw {Support-Signals};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "Support-Signals" {aep_top.aep_bounds.sigB} {aep_top.clk} };
wvAddGroup -win $::vcst::_curWaveVw {Constant-Inputs};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "Constant-Inputs" {aep_top.din} };wvCollapseGroup -win $::vcst::_curWaveVw {Constant-Inputs};
wvGoToGroup -win $::vcst::_curWaveVw AEP-Property
wvSetPosition -win $::vcst::_curWaveVw {("Support-Signals" last)}
::vcst::addResetMarker 1000
::vcst::showDebugViews -100 true true
srcShowDefine -incrSearch {aep_top.aep_bounds.bounds_check_0}; 
wvZoomAll -win $::vcst::_curWaveVw
verdiSetStatusMsg -win $_Verdi_1 -2nd "Trace is loaded"
sysWarnEnable -enable; set ::vcst::sysWarnEnable 1
verdiVcstOnPropSelectionChanged -strNum 1 -propList {aep_top.aep_parallel.parallel_case_0}
verdiSetStatusMsg -win $_Verdi_1 -2nd "Preparing FSDB..."
verdiGetVcstCmdResult -xmlstr {<Command name="view_trace" status="1" />}
verdiSetStatusMsg -win $_Verdi_1 -2nd "FSDB is ready, Waveform loading..."
sysWarnEnable -disable; set ::vcst::sysWarnEnable 0
wvGetAllWindows
expPropGetAttr -is_nav_wave 1c8f2d80
set ::vcst::_fsdb $::vcst::_rtdbDir/.internal/formal/fpId0/trace_7.xml.replay.fsdb.vf;
expPropVcstDataUpdated -initFSDB $::vcst::_fsdb;
wvCloseFile -win $::vcst::_curWaveVw
::vcst::wvOpenFsdb $::vcst::_curWaveVw $::vcst::_fsdb
verdiVcstFsdbAppMode -fsdb $::vcst::_fsdb -AppMode AEP
set ::vcst::_propClass {aep}
set ::vcst::_propLoc {rtl/aep_parallel.v:9}
set ::vcst::_propType {parallel_case}
set ::vcst::_propExpr {din}
set ::vcst::_sva {aep_top.aep_parallel.parallel_case_0}
verdiDockWidgetHide -dock widgetDock_Analyzer
::vcst::updatePropertyMap

set ::vcst::traceTypeMap($::vcst::actualFsdb) property

wvAddGroup -win $::vcst::_curWaveVw {AEP-Property};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "AEP-Property" {aep_top.aep_parallel.parallel_case_0} };
wvAddGroup -win $::vcst::_curWaveVw {Support-Signals};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "Support-Signals" {aep_top.aep_parallel.din} {aep_top.clk} };
wvAddGroup -win $::vcst::_curWaveVw {Most-Toggled-Registers};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "Most-Toggled-Registers" {aep_top.din_d} };wvCollapseGroup -win $::vcst::_curWaveVw {Most-Toggled-Registers};
wvAddGroup -win $::vcst::_curWaveVw {Constant-Inputs};wvAddSignal -fromVCST -delim "." -win $::vcst::_curWaveVw -group { "Constant-Inputs" {aep_top.din} {aep_top.rst} };wvCollapseGroup -win $::vcst::_curWaveVw {Constant-Inputs};
wvGoToGroup -win $::vcst::_curWaveVw AEP-Property
wvSetPosition -win $::vcst::_curWaveVw {("Support-Signals" last)}
::vcst::addResetMarker 1000
::vcst::showDebugViews -100 true true
srcShowDefine -incrSearch {aep_top.aep_parallel.parallel_case_0}; 
wvZoomAll -win $::vcst::_curWaveVw
verdiSetStatusMsg -win $_Verdi_1 -2nd "Trace is loaded"
sysWarnEnable -enable; set ::vcst::sysWarnEnable 1
