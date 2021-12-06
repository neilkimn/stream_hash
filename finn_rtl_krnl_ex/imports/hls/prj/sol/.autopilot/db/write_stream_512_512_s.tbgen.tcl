set moduleName write_stream_512_512_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {write_stream<512, 512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ acc_data_V_read int 512 regular  }
	{ acc_keep_V_read int 64 regular  }
	{ acc_last_V_read int 1 regular  }
	{ m_axis_V_data_V int 512 regular {axi_s 1 volatile  { axis00 Data } }  }
	{ m_axis_V_keep_V int 64 regular {axi_s 1 volatile  { axis00 Keep } }  }
	{ m_axis_V_last_V int 1 regular {axi_s 1 volatile  { axis00 Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "acc_data_V_read", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "acc_keep_V_read", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "acc_last_V_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acc_data_V_read sc_in sc_lv 512 signal 0 } 
	{ acc_keep_V_read sc_in sc_lv 64 signal 1 } 
	{ acc_last_V_read sc_in sc_lv 1 signal 2 } 
	{ axis00_TDATA sc_out sc_lv 512 signal 3 } 
	{ axis00_TVALID sc_out sc_logic 1 outvld 5 } 
	{ axis00_TREADY sc_in sc_logic 1 outacc 3 } 
	{ axis00_TKEEP sc_out sc_lv 64 signal 4 } 
	{ axis00_TLAST sc_out sc_lv 1 signal 5 } 
	{ axis00_TDATA_blk_n sc_out sc_logic 1 signal -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acc_data_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "acc_data_V_read", "role": "default" }} , 
 	{ "name": "acc_keep_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "acc_keep_V_read", "role": "default" }} , 
 	{ "name": "acc_last_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "acc_last_V_read", "role": "default" }} , 
 	{ "name": "axis00_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "axis00_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "axis00_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "axis00_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TDATA_blk_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axis00_TDATA_blk_n", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "write_stream_512_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "acc_data_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "acc_keep_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "acc_last_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "m_axis_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "axis00_TDATA_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "m_axis_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	write_stream_512_512_s {
		acc_data_V_read {Type I LastRead 0 FirstWrite -1}
		acc_keep_V_read {Type I LastRead 0 FirstWrite -1}
		acc_last_V_read {Type I LastRead 0 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	acc_data_V_read { ap_none {  { acc_data_V_read in_data 0 512 } } }
	acc_keep_V_read { ap_none {  { acc_keep_V_read in_data 0 64 } } }
	acc_last_V_read { ap_none {  { acc_last_V_read in_data 0 1 } } }
	m_axis_V_data_V { axis {  { axis00_TDATA out_data 1 512 }  { axis00_TREADY out_acc 0 1 } } }
	m_axis_V_keep_V { axis {  { axis00_TKEEP out_data 1 64 } } }
	m_axis_V_last_V { axis {  { axis00_TVALID out_vld 1 1 }  { axis00_TLAST out_data 1 1 } } }
}
