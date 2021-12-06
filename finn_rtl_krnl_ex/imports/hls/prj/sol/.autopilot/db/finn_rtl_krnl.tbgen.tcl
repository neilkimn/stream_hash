set moduleName finn_rtl_krnl
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {finn_rtl_krnl}
set C_modelType { void 0 }
set C_modelArgList {
	{ axis00_V_data_V int 512 regular {axi_s 1 volatile  { axis00 Data } }  }
	{ axis00_V_keep_V int 64 regular {axi_s 1 volatile  { axis00 Keep } }  }
	{ axis00_V_last_V int 1 regular {axi_s 1 volatile  { axis00 Last } }  }
	{ axis01_V_data_V int 512 regular {axi_s 0 volatile  { axis01 Data } }  }
	{ axis01_V_keep_V int 64 regular {axi_s 0 volatile  { axis01 Keep } }  }
	{ axis01_V_last_V int 1 regular {axi_s 0 volatile  { axis01 Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "axis00_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "axis00.V.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "axis00_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "axis00.V.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "axis00_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "axis00.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "axis01_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "axis01.V.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "axis01_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "axis01.V.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "axis01_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "axis01.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ axis00_TDATA sc_out sc_lv 512 signal 0 } 
	{ axis00_TVALID sc_out sc_logic 1 outvld 2 } 
	{ axis00_TREADY sc_in sc_logic 1 outacc 2 } 
	{ axis00_TKEEP sc_out sc_lv 64 signal 1 } 
	{ axis00_TLAST sc_out sc_lv 1 signal 2 } 
	{ axis01_TDATA sc_in sc_lv 512 signal 3 } 
	{ axis01_TVALID sc_in sc_logic 1 invld 5 } 
	{ axis01_TREADY sc_out sc_logic 1 inacc 5 } 
	{ axis01_TKEEP sc_in sc_lv 64 signal 4 } 
	{ axis01_TLAST sc_in sc_lv 1 signal 5 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"finn_rtl_krnl","role":"start","value":"0","valid_bit":"0"},{"name":"finn_rtl_krnl","role":"continue","value":"0","valid_bit":"4"},{"name":"finn_rtl_krnl","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"finn_rtl_krnl","role":"start","value":"0","valid_bit":"0"},{"name":"finn_rtl_krnl","role":"done","value":"0","valid_bit":"1"},{"name":"finn_rtl_krnl","role":"idle","value":"0","valid_bit":"2"},{"name":"finn_rtl_krnl","role":"ready","value":"0","valid_bit":"3"},{"name":"finn_rtl_krnl","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "axis00_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "axis00_V_data_V", "role": "default" }} , 
 	{ "name": "axis00_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "axis00_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "axis00_V_last_V", "role": "default" }} , 
 	{ "name": "axis00_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "axis00_V_keep_V", "role": "default" }} , 
 	{ "name": "axis00_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "axis00_V_last_V", "role": "default" }} , 
 	{ "name": "axis01_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "axis01_V_data_V", "role": "default" }} , 
 	{ "name": "axis01_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "axis01_V_last_V", "role": "default" }} , 
 	{ "name": "axis01_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "axis01_V_last_V", "role": "default" }} , 
 	{ "name": "axis01_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "axis01_V_keep_V", "role": "default" }} , 
 	{ "name": "axis01_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "axis01_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "finn_rtl_krnl",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"WaitState" : [
			{"State" : "ap_ST_fsm_state3", "FSM" : "ap_CS_fsm", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38"}],
		"Port" : [
			{"Name" : "axis00_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "m_axis_V_data_V"}]},
			{"Name" : "axis00_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "m_axis_V_keep_V"}]},
			{"Name" : "axis00_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "m_axis_V_last_V"}]},
			{"Name" : "axis01_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "s_axis_V_data_V"}]},
			{"Name" : "axis01_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "s_axis_V_keep_V"}]},
			{"Name" : "axis01_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_38", "Port" : "s_axis_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.finn_rtl_krnl_control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_example_stream_plus1_512_512_s_fu_38", "Parent" : "0", "Child" : ["3", "4"],
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
					{"ID" : "4", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_data_V"}]},
			{"Name" : "s_axis_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_keep_V"}]},
			{"Name" : "s_axis_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "Port" : "s_axis_V_last_V"}]},
			{"Name" : "m_axis_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "axis00_TDATA_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_data_V"}]},
			{"Name" : "m_axis_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_keep_V"}]},
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "Port" : "m_axis_V_last_V"}]}],
		"SubInstanceBlock" : [
			{"SubInstance" : "call_ln100_write_stream_512_512_s_fu_98", "SubBlockPort" : ["axis00_TDATA_blk_n"]},
			{"SubInstance" : "call_ret_read_stream_512_512_s_fu_111", "SubBlockPort" : ["axis01_TDATA_blk_n"]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_example_stream_plus1_512_512_s_fu_38.call_ln100_write_stream_512_512_s_fu_98", "Parent" : "2",
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_example_stream_plus1_512_512_s_fu_38.call_ret_read_stream_512_512_s_fu_111", "Parent" : "2",
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
			{"Name" : "s_axis_V_last_V", "Type" : "Axis", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis00_V_data_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis00_V_keep_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis00_V_last_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis01_V_data_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis01_V_keep_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_axis01_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	finn_rtl_krnl {
		axis00_V_data_V {Type O LastRead -1 FirstWrite 0}
		axis00_V_keep_V {Type O LastRead -1 FirstWrite 0}
		axis00_V_last_V {Type O LastRead -1 FirstWrite 0}
		axis01_V_data_V {Type I LastRead 0 FirstWrite -1}
		axis01_V_keep_V {Type I LastRead 0 FirstWrite -1}
		axis01_V_last_V {Type I LastRead 0 FirstWrite -1}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	axis00_V_data_V { axis {  { axis00_TDATA out_data 1 512 } } }
	axis00_V_keep_V { axis {  { axis00_TKEEP out_data 1 64 } } }
	axis00_V_last_V { axis {  { axis00_TVALID out_vld 1 1 }  { axis00_TREADY out_acc 0 1 }  { axis00_TLAST out_data 1 1 } } }
	axis01_V_data_V { axis {  { axis01_TDATA in_data 0 512 } } }
	axis01_V_keep_V { axis {  { axis01_TKEEP in_data 0 64 } } }
	axis01_V_last_V { axis {  { axis01_TVALID in_vld 0 1 }  { axis01_TREADY in_acc 1 1 }  { axis01_TLAST in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
