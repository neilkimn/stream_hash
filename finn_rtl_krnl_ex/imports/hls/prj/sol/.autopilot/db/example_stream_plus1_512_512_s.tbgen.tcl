set moduleName example_stream_plus1_512_512_s
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {example_stream_plus1<512, 512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_V_data_V int 512 regular {axi_s 0 volatile  { axis01 Data } }  }
	{ s_axis_V_keep_V int 64 regular {axi_s 0 volatile  { axis01 Keep } }  }
	{ s_axis_V_last_V int 1 regular {axi_s 0 volatile  { axis01 Last } }  }
	{ m_axis_V_data_V int 512 regular {axi_s 1 volatile  { axis00 Data } }  }
	{ m_axis_V_keep_V int 64 regular {axi_s 1 volatile  { axis00 Keep } }  }
	{ m_axis_V_last_V int 1 regular {axi_s 1 volatile  { axis00 Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
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
	{ axis01_TDATA sc_in sc_lv 512 signal 0 } 
	{ axis01_TVALID sc_in sc_logic 1 invld 2 } 
	{ axis01_TREADY sc_out sc_logic 1 inacc 2 } 
	{ axis01_TKEEP sc_in sc_lv 64 signal 1 } 
	{ axis01_TLAST sc_in sc_lv 1 signal 2 } 
	{ axis00_TDATA sc_out sc_lv 512 signal 3 } 
	{ axis00_TVALID sc_out sc_logic 1 outvld 5 } 
	{ axis00_TREADY sc_in sc_logic 1 outacc 5 } 
	{ axis00_TKEEP sc_out sc_lv 64 signal 4 } 
	{ axis00_TLAST sc_out sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "axis01_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "axis01_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis01_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis01_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "axis01_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "axis00_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "axis00_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "example_stream_plus1_512_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "s_axis_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "axis01_TDATA_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_data_V"}]},
			{"Name" : "s_axis_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_keep_V"}]},
			{"Name" : "s_axis_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_last_V"}]},
			{"Name" : "m_axis_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "axis00_TDATA_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_data_V"}]},
			{"Name" : "m_axis_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_keep_V"}]},
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_last_V"}]}],
		"SubInstanceBlock" : [
			{"SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "SubBlockPort" : ["axis00_TDATA_blk_n"]},
			{"SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "SubBlockPort" : ["axis01_TDATA_blk_n"]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ln100_write_stream_512_512_s_fu_98", "Parent" : "0",
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
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret_read_stream_512_512_s_fu_111", "Parent" : "0",
		"CDFG" : "read_stream_512_512_s",
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
			{"Name" : "s_axis_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "axis01_TDATA_blk_n", "Type" : "RtlPort"}]},
			{"Name" : "s_axis_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_V_last_V", "Type" : "Axis", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	example_stream_plus1_512_512_s {
		s_axis_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_last_V {Type I LastRead 0 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 0}}
	write_stream_512_512_s {
		acc_data_V_read {Type I LastRead 0 FirstWrite -1}
		acc_keep_V_read {Type I LastRead 0 FirstWrite -1}
		acc_last_V_read {Type I LastRead 0 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 0}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 0}}
	read_stream_512_512_s {
		s_axis_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_last_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_V_data_V { axis {  { axis01_TDATA in_data 0 512 } } }
	s_axis_V_keep_V { axis {  { axis01_TKEEP in_data 0 64 } } }
	s_axis_V_last_V { axis {  { axis01_TVALID in_vld 0 1 }  { axis01_TREADY in_acc 1 1 }  { axis01_TLAST in_data 0 1 } } }
	m_axis_V_data_V { axis {  { axis00_TDATA out_data 1 512 } } }
	m_axis_V_keep_V { axis {  { axis00_TKEEP out_data 1 64 } } }
	m_axis_V_last_V { axis {  { axis00_TVALID out_vld 1 1 }  { axis00_TREADY out_acc 0 1 }  { axis00_TLAST out_data 1 1 } } }
}
