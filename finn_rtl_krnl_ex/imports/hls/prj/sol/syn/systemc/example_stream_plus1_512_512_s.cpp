// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "example_stream_plus1_512_512_s.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic example_stream_plus1_512_512_s::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic example_stream_plus1_512_512_s::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<4> example_stream_plus1_512_512_s::ap_ST_fsm_state1 = "1";
const sc_lv<4> example_stream_plus1_512_512_s::ap_ST_fsm_state2 = "10";
const sc_lv<4> example_stream_plus1_512_512_s::ap_ST_fsm_state3 = "100";
const sc_lv<4> example_stream_plus1_512_512_s::ap_ST_fsm_state4 = "1000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_2 = "10";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1 = "1";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_20 = "100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_3F = "111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_40 = "1000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_5F = "1011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_60 = "1100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_7F = "1111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_80 = "10000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_9F = "10011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_A0 = "10100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_BF = "10111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_C0 = "11000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_DF = "11011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_E0 = "11100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_FF = "11111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_100 = "100000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_11F = "100011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_120 = "100100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_13F = "100111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_140 = "101000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_15F = "101011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_160 = "101100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_17F = "101111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_180 = "110000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_19F = "110011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1A0 = "110100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1BF = "110111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1C0 = "111000000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1DF = "111011111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1E0 = "111100000";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_1FF = "111111111";
const sc_lv<32> example_stream_plus1_512_512_s::ap_const_lv32_3 = "11";
const sc_lv<1> example_stream_plus1_512_512_s::ap_const_lv1_1 = "1";
const sc_lv<1> example_stream_plus1_512_512_s::ap_const_lv1_0 = "0";
const bool example_stream_plus1_512_512_s::ap_const_boolean_1 = true;

example_stream_plus1_512_512_s::example_stream_plus1_512_512_s(sc_module_name name) : sc_module(name), mVcdFile(0) {
    call_ln100_write_stream_512_512_s_fu_98 = new write_stream_512_512_s("call_ln100_write_stream_512_512_s_fu_98");
    call_ln100_write_stream_512_512_s_fu_98->ap_clk(ap_clk);
    call_ln100_write_stream_512_512_s_fu_98->ap_rst(ap_rst);
    call_ln100_write_stream_512_512_s_fu_98->ap_start(call_ln100_write_stream_512_512_s_fu_98_ap_start);
    call_ln100_write_stream_512_512_s_fu_98->ap_done(call_ln100_write_stream_512_512_s_fu_98_ap_done);
    call_ln100_write_stream_512_512_s_fu_98->ap_idle(call_ln100_write_stream_512_512_s_fu_98_ap_idle);
    call_ln100_write_stream_512_512_s_fu_98->ap_ready(call_ln100_write_stream_512_512_s_fu_98_ap_ready);
    call_ln100_write_stream_512_512_s_fu_98->acc_data_V_read(call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read);
    call_ln100_write_stream_512_512_s_fu_98->acc_keep_V_read(call_ret_read_stream_512_512_s_fu_111_ap_return_1);
    call_ln100_write_stream_512_512_s_fu_98->acc_last_V_read(call_ret_read_stream_512_512_s_fu_111_ap_return_2);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TDATA(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TVALID(call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TREADY(call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TKEEP(call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TLAST(call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST);
    call_ln100_write_stream_512_512_s_fu_98->axis00_TDATA_blk_n(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n);
    call_ln100_write_stream_512_512_s_fu_98->ap_ce(call_ln100_write_stream_512_512_s_fu_98_ap_ce);
    call_ret_read_stream_512_512_s_fu_111 = new read_stream_512_512_s("call_ret_read_stream_512_512_s_fu_111");
    call_ret_read_stream_512_512_s_fu_111->ap_clk(ap_clk);
    call_ret_read_stream_512_512_s_fu_111->ap_rst(ap_rst);
    call_ret_read_stream_512_512_s_fu_111->ap_start(call_ret_read_stream_512_512_s_fu_111_ap_start);
    call_ret_read_stream_512_512_s_fu_111->ap_done(call_ret_read_stream_512_512_s_fu_111_ap_done);
    call_ret_read_stream_512_512_s_fu_111->ap_idle(call_ret_read_stream_512_512_s_fu_111_ap_idle);
    call_ret_read_stream_512_512_s_fu_111->ap_ready(call_ret_read_stream_512_512_s_fu_111_ap_ready);
    call_ret_read_stream_512_512_s_fu_111->axis01_TDATA(axis01_TDATA);
    call_ret_read_stream_512_512_s_fu_111->axis01_TVALID(axis01_TVALID);
    call_ret_read_stream_512_512_s_fu_111->axis01_TREADY(call_ret_read_stream_512_512_s_fu_111_axis01_TREADY);
    call_ret_read_stream_512_512_s_fu_111->axis01_TKEEP(axis01_TKEEP);
    call_ret_read_stream_512_512_s_fu_111->axis01_TLAST(axis01_TLAST);
    call_ret_read_stream_512_512_s_fu_111->ap_return_0(call_ret_read_stream_512_512_s_fu_111_ap_return_0);
    call_ret_read_stream_512_512_s_fu_111->ap_return_1(call_ret_read_stream_512_512_s_fu_111_ap_return_1);
    call_ret_read_stream_512_512_s_fu_111->ap_return_2(call_ret_read_stream_512_512_s_fu_111_ap_return_2);
    call_ret_read_stream_512_512_s_fu_111->axis01_TDATA_blk_n(call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n);
    call_ret_read_stream_512_512_s_fu_111->ap_ce(call_ret_read_stream_512_512_s_fu_111_ap_ce);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_acc_last_V_fu_130_p1);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_2 );

    SC_METHOD(thread_add_ln215_10_fu_299_p2);
    sensitive << ( p_Result_4_i_fu_289_p4 );

    SC_METHOD(thread_add_ln215_11_fu_315_p2);
    sensitive << ( p_Result_4_10_i_fu_305_p4 );

    SC_METHOD(thread_add_ln215_12_fu_331_p2);
    sensitive << ( p_Result_4_11_i_fu_321_p4 );

    SC_METHOD(thread_add_ln215_13_fu_347_p2);
    sensitive << ( p_Result_4_12_i_fu_337_p4 );

    SC_METHOD(thread_add_ln215_14_fu_363_p2);
    sensitive << ( p_Result_4_13_i_fu_353_p4 );

    SC_METHOD(thread_add_ln215_15_fu_379_p2);
    sensitive << ( p_Result_4_14_i_fu_369_p4 );

    SC_METHOD(thread_add_ln215_1_fu_155_p2);
    sensitive << ( p_Result_4_1_i_fu_145_p4 );

    SC_METHOD(thread_add_ln215_2_fu_171_p2);
    sensitive << ( p_Result_4_2_i_fu_161_p4 );

    SC_METHOD(thread_add_ln215_3_fu_187_p2);
    sensitive << ( p_Result_4_3_i_fu_177_p4 );

    SC_METHOD(thread_add_ln215_4_fu_203_p2);
    sensitive << ( p_Result_4_4_i_fu_193_p4 );

    SC_METHOD(thread_add_ln215_5_fu_219_p2);
    sensitive << ( p_Result_4_5_i_fu_209_p4 );

    SC_METHOD(thread_add_ln215_6_fu_235_p2);
    sensitive << ( p_Result_4_6_i_fu_225_p4 );

    SC_METHOD(thread_add_ln215_7_fu_251_p2);
    sensitive << ( p_Result_4_7_i_fu_241_p4 );

    SC_METHOD(thread_add_ln215_8_fu_267_p2);
    sensitive << ( p_Result_4_8_i_fu_257_p4 );

    SC_METHOD(thread_add_ln215_9_fu_283_p2);
    sensitive << ( p_Result_4_9_i_fu_273_p4 );

    SC_METHOD(thread_add_ln215_fu_139_p2);
    sensitive << ( trunc_ln647_fu_135_p1 );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state4);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_block_state3);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_CS_fsm_state4 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm_state4 );

    SC_METHOD(thread_axis00_TDATA);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID );

    SC_METHOD(thread_axis00_TDATA_blk_n);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n );

    SC_METHOD(thread_axis00_TKEEP);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP );

    SC_METHOD(thread_axis00_TLAST);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST );

    SC_METHOD(thread_axis00_TVALID);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID );

    SC_METHOD(thread_axis01_TDATA_blk_n);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_axis01_TREADY);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TREADY );

    SC_METHOD(thread_call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( add_ln215_15_fu_379_p2 );
    sensitive << ( add_ln215_14_fu_363_p2 );
    sensitive << ( add_ln215_13_fu_347_p2 );
    sensitive << ( add_ln215_12_fu_331_p2 );
    sensitive << ( add_ln215_11_fu_315_p2 );
    sensitive << ( add_ln215_10_fu_299_p2 );
    sensitive << ( add_ln215_9_fu_283_p2 );
    sensitive << ( add_ln215_8_fu_267_p2 );
    sensitive << ( add_ln215_7_fu_251_p2 );
    sensitive << ( add_ln215_6_fu_235_p2 );
    sensitive << ( add_ln215_5_fu_219_p2 );
    sensitive << ( add_ln215_4_fu_203_p2 );
    sensitive << ( add_ln215_3_fu_187_p2 );
    sensitive << ( add_ln215_2_fu_171_p2 );
    sensitive << ( add_ln215_1_fu_155_p2 );
    sensitive << ( add_ln215_fu_139_p2 );

    SC_METHOD(thread_call_ln100_write_stream_512_512_s_fu_98_ap_ce);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_call_ln100_write_stream_512_512_s_fu_98_ap_start);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY);
    sensitive << ( axis00_TREADY );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_call_ret_read_stream_512_512_s_fu_111_ap_ce);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n );

    SC_METHOD(thread_call_ret_read_stream_512_512_s_fu_111_ap_start);
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n );

    SC_METHOD(thread_p_Result_4_10_i_fu_305_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_11_i_fu_321_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_12_i_fu_337_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_13_i_fu_353_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_14_i_fu_369_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_1_i_fu_145_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_2_i_fu_161_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_3_i_fu_177_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_4_i_fu_193_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_5_i_fu_209_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_6_i_fu_225_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_7_i_fu_241_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_8_i_fu_257_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_9_i_fu_273_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_p_Result_4_i_fu_289_p4);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_trunc_ln647_fu_135_p1);
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_ap_return_0 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n );
    sensitive << ( acc_last_V_fu_130_p1 );

    ap_CS_fsm = "0001";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "example_stream_plus1_512_512_s_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, axis01_TDATA, "(port)axis01_TDATA");
    sc_trace(mVcdFile, axis01_TVALID, "(port)axis01_TVALID");
    sc_trace(mVcdFile, axis01_TREADY, "(port)axis01_TREADY");
    sc_trace(mVcdFile, axis01_TKEEP, "(port)axis01_TKEEP");
    sc_trace(mVcdFile, axis01_TLAST, "(port)axis01_TLAST");
    sc_trace(mVcdFile, axis00_TDATA, "(port)axis00_TDATA");
    sc_trace(mVcdFile, axis00_TVALID, "(port)axis00_TVALID");
    sc_trace(mVcdFile, axis00_TREADY, "(port)axis00_TREADY");
    sc_trace(mVcdFile, axis00_TKEEP, "(port)axis00_TKEEP");
    sc_trace(mVcdFile, axis00_TLAST, "(port)axis00_TLAST");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n, "call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n");
    sc_trace(mVcdFile, axis01_TDATA_blk_n, "axis01_TDATA_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n, "call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n");
    sc_trace(mVcdFile, axis00_TDATA_blk_n, "axis00_TDATA_blk_n");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_ap_start, "call_ln100_write_stream_512_512_s_fu_98_ap_start");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_ap_done, "call_ln100_write_stream_512_512_s_fu_98_ap_done");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_ap_idle, "call_ln100_write_stream_512_512_s_fu_98_ap_idle");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_ap_ready, "call_ln100_write_stream_512_512_s_fu_98_ap_ready");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read, "call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA, "call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID, "call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY, "call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP, "call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST, "call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST");
    sc_trace(mVcdFile, call_ln100_write_stream_512_512_s_fu_98_ap_ce, "call_ln100_write_stream_512_512_s_fu_98_ap_ce");
    sc_trace(mVcdFile, ap_block_state3, "ap_block_state3");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_start, "call_ret_read_stream_512_512_s_fu_111_ap_start");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_done, "call_ret_read_stream_512_512_s_fu_111_ap_done");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_idle, "call_ret_read_stream_512_512_s_fu_111_ap_idle");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_ready, "call_ret_read_stream_512_512_s_fu_111_ap_ready");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_axis01_TREADY, "call_ret_read_stream_512_512_s_fu_111_axis01_TREADY");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_return_0, "call_ret_read_stream_512_512_s_fu_111_ap_return_0");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_return_1, "call_ret_read_stream_512_512_s_fu_111_ap_return_1");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_return_2, "call_ret_read_stream_512_512_s_fu_111_ap_return_2");
    sc_trace(mVcdFile, call_ret_read_stream_512_512_s_fu_111_ap_ce, "call_ret_read_stream_512_512_s_fu_111_ap_ce");
    sc_trace(mVcdFile, acc_last_V_fu_130_p1, "acc_last_V_fu_130_p1");
    sc_trace(mVcdFile, trunc_ln647_fu_135_p1, "trunc_ln647_fu_135_p1");
    sc_trace(mVcdFile, p_Result_4_1_i_fu_145_p4, "p_Result_4_1_i_fu_145_p4");
    sc_trace(mVcdFile, p_Result_4_2_i_fu_161_p4, "p_Result_4_2_i_fu_161_p4");
    sc_trace(mVcdFile, p_Result_4_3_i_fu_177_p4, "p_Result_4_3_i_fu_177_p4");
    sc_trace(mVcdFile, p_Result_4_4_i_fu_193_p4, "p_Result_4_4_i_fu_193_p4");
    sc_trace(mVcdFile, p_Result_4_5_i_fu_209_p4, "p_Result_4_5_i_fu_209_p4");
    sc_trace(mVcdFile, p_Result_4_6_i_fu_225_p4, "p_Result_4_6_i_fu_225_p4");
    sc_trace(mVcdFile, p_Result_4_7_i_fu_241_p4, "p_Result_4_7_i_fu_241_p4");
    sc_trace(mVcdFile, p_Result_4_8_i_fu_257_p4, "p_Result_4_8_i_fu_257_p4");
    sc_trace(mVcdFile, p_Result_4_9_i_fu_273_p4, "p_Result_4_9_i_fu_273_p4");
    sc_trace(mVcdFile, p_Result_4_i_fu_289_p4, "p_Result_4_i_fu_289_p4");
    sc_trace(mVcdFile, p_Result_4_10_i_fu_305_p4, "p_Result_4_10_i_fu_305_p4");
    sc_trace(mVcdFile, p_Result_4_11_i_fu_321_p4, "p_Result_4_11_i_fu_321_p4");
    sc_trace(mVcdFile, p_Result_4_12_i_fu_337_p4, "p_Result_4_12_i_fu_337_p4");
    sc_trace(mVcdFile, p_Result_4_13_i_fu_353_p4, "p_Result_4_13_i_fu_353_p4");
    sc_trace(mVcdFile, p_Result_4_14_i_fu_369_p4, "p_Result_4_14_i_fu_369_p4");
    sc_trace(mVcdFile, add_ln215_15_fu_379_p2, "add_ln215_15_fu_379_p2");
    sc_trace(mVcdFile, add_ln215_14_fu_363_p2, "add_ln215_14_fu_363_p2");
    sc_trace(mVcdFile, add_ln215_13_fu_347_p2, "add_ln215_13_fu_347_p2");
    sc_trace(mVcdFile, add_ln215_12_fu_331_p2, "add_ln215_12_fu_331_p2");
    sc_trace(mVcdFile, add_ln215_11_fu_315_p2, "add_ln215_11_fu_315_p2");
    sc_trace(mVcdFile, add_ln215_10_fu_299_p2, "add_ln215_10_fu_299_p2");
    sc_trace(mVcdFile, add_ln215_9_fu_283_p2, "add_ln215_9_fu_283_p2");
    sc_trace(mVcdFile, add_ln215_8_fu_267_p2, "add_ln215_8_fu_267_p2");
    sc_trace(mVcdFile, add_ln215_7_fu_251_p2, "add_ln215_7_fu_251_p2");
    sc_trace(mVcdFile, add_ln215_6_fu_235_p2, "add_ln215_6_fu_235_p2");
    sc_trace(mVcdFile, add_ln215_5_fu_219_p2, "add_ln215_5_fu_219_p2");
    sc_trace(mVcdFile, add_ln215_4_fu_203_p2, "add_ln215_4_fu_203_p2");
    sc_trace(mVcdFile, add_ln215_3_fu_187_p2, "add_ln215_3_fu_187_p2");
    sc_trace(mVcdFile, add_ln215_2_fu_171_p2, "add_ln215_2_fu_171_p2");
    sc_trace(mVcdFile, add_ln215_1_fu_155_p2, "add_ln215_1_fu_155_p2");
    sc_trace(mVcdFile, add_ln215_fu_139_p2, "add_ln215_fu_139_p2");
    sc_trace(mVcdFile, ap_CS_fsm_state4, "ap_CS_fsm_state4");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

example_stream_plus1_512_512_s::~example_stream_plus1_512_512_s() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete call_ln100_write_stream_512_512_s_fu_98;
    delete call_ret_read_stream_512_512_s_fu_111;
}

void example_stream_plus1_512_512_s::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
}

void example_stream_plus1_512_512_s::thread_acc_last_V_fu_130_p1() {
    acc_last_V_fu_130_p1 = call_ret_read_stream_512_512_s_fu_111_ap_return_2.read();
}

void example_stream_plus1_512_512_s::thread_add_ln215_10_fu_299_p2() {
    add_ln215_10_fu_299_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_i_fu_289_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_i_fu_289_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_11_fu_315_p2() {
    add_ln215_11_fu_315_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_10_i_fu_305_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_10_i_fu_305_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_12_fu_331_p2() {
    add_ln215_12_fu_331_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_11_i_fu_321_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_11_i_fu_321_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_13_fu_347_p2() {
    add_ln215_13_fu_347_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_12_i_fu_337_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_12_i_fu_337_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_14_fu_363_p2() {
    add_ln215_14_fu_363_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_13_i_fu_353_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_13_i_fu_353_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_15_fu_379_p2() {
    add_ln215_15_fu_379_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_14_i_fu_369_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_14_i_fu_369_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_1_fu_155_p2() {
    add_ln215_1_fu_155_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_1_i_fu_145_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_1_i_fu_145_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_2_fu_171_p2() {
    add_ln215_2_fu_171_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_2_i_fu_161_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_2_i_fu_161_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_3_fu_187_p2() {
    add_ln215_3_fu_187_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_3_i_fu_177_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_3_i_fu_177_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_4_fu_203_p2() {
    add_ln215_4_fu_203_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_4_i_fu_193_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_4_i_fu_193_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_5_fu_219_p2() {
    add_ln215_5_fu_219_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_5_i_fu_209_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_5_i_fu_209_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_6_fu_235_p2() {
    add_ln215_6_fu_235_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_6_i_fu_225_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_6_i_fu_225_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_7_fu_251_p2() {
    add_ln215_7_fu_251_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_7_i_fu_241_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_7_i_fu_241_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_8_fu_267_p2() {
    add_ln215_8_fu_267_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_8_i_fu_257_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_8_i_fu_257_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_9_fu_283_p2() {
    add_ln215_9_fu_283_p2 = (!ap_const_lv32_1.is_01() || !p_Result_4_9_i_fu_273_p4.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(p_Result_4_9_i_fu_273_p4.read()));
}

void example_stream_plus1_512_512_s::thread_add_ln215_fu_139_p2() {
    add_ln215_fu_139_p2 = (!ap_const_lv32_1.is_01() || !trunc_ln647_fu_135_p1.read().is_01())? sc_lv<32>(): (sc_biguint<32>(ap_const_lv32_1) + sc_biguint<32>(trunc_ln647_fu_135_p1.read()));
}

void example_stream_plus1_512_512_s::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void example_stream_plus1_512_512_s::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void example_stream_plus1_512_512_s::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void example_stream_plus1_512_512_s::thread_ap_block_state3() {
    ap_block_state3 = (esl_seteq<1,1,1>(ap_const_logic_0, call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read()) || esl_seteq<1,1,1>(ap_const_logic_0, call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read()));
}

void example_stream_plus1_512_512_s::thread_ap_done() {
    if (((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_ap_ready() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_axis00_TDATA() {
    axis00_TDATA = call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA.read();
}

void example_stream_plus1_512_512_s::thread_axis00_TDATA_blk_n() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        axis00_TDATA_blk_n = call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read();
    } else {
        axis00_TDATA_blk_n = ap_const_logic_1;
    }
}

void example_stream_plus1_512_512_s::thread_axis00_TKEEP() {
    axis00_TKEEP = call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP.read();
}

void example_stream_plus1_512_512_s::thread_axis00_TLAST() {
    axis00_TLAST = call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST.read();
}

void example_stream_plus1_512_512_s::thread_axis00_TVALID() {
    axis00_TVALID = call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID.read();
}

void example_stream_plus1_512_512_s::thread_axis01_TDATA_blk_n() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        axis01_TDATA_blk_n = call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read();
    } else {
        axis01_TDATA_blk_n = ap_const_logic_1;
    }
}

void example_stream_plus1_512_512_s::thread_axis01_TREADY() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        axis01_TREADY = call_ret_read_stream_512_512_s_fu_111_axis01_TREADY.read();
    } else {
        axis01_TREADY = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read() {
    call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read = esl_concat<480,32>(esl_concat<448,32>(esl_concat<416,32>(esl_concat<384,32>(esl_concat<352,32>(esl_concat<320,32>(esl_concat<288,32>(esl_concat<256,32>(esl_concat<224,32>(esl_concat<192,32>(esl_concat<160,32>(esl_concat<128,32>(esl_concat<96,32>(esl_concat<64,32>(esl_concat<32,32>(add_ln215_15_fu_379_p2.read(), add_ln215_14_fu_363_p2.read()), add_ln215_13_fu_347_p2.read()), add_ln215_12_fu_331_p2.read()), add_ln215_11_fu_315_p2.read()), add_ln215_10_fu_299_p2.read()), add_ln215_9_fu_283_p2.read()), add_ln215_8_fu_267_p2.read()), add_ln215_7_fu_251_p2.read()), add_ln215_6_fu_235_p2.read()), add_ln215_5_fu_219_p2.read()), add_ln215_4_fu_203_p2.read()), add_ln215_3_fu_187_p2.read()), add_ln215_2_fu_171_p2.read()), add_ln215_1_fu_155_p2.read()), add_ln215_fu_139_p2.read());
}

void example_stream_plus1_512_512_s::thread_call_ln100_write_stream_512_512_s_fu_98_ap_ce() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read(), ap_const_logic_1))) {
        call_ln100_write_stream_512_512_s_fu_98_ap_ce = ap_const_logic_1;
    } else {
        call_ln100_write_stream_512_512_s_fu_98_ap_ce = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_call_ln100_write_stream_512_512_s_fu_98_ap_start() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read(), ap_const_logic_1))) {
        call_ln100_write_stream_512_512_s_fu_98_ap_start = ap_const_logic_1;
    } else {
        call_ln100_write_stream_512_512_s_fu_98_ap_start = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY() {
    call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY = (axis00_TREADY.read() & ap_CS_fsm_state3.read());
}

void example_stream_plus1_512_512_s::thread_call_ret_read_stream_512_512_s_fu_111_ap_ce() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read(), ap_const_logic_1))) {
        call_ret_read_stream_512_512_s_fu_111_ap_ce = ap_const_logic_1;
    } else {
        call_ret_read_stream_512_512_s_fu_111_ap_ce = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_call_ret_read_stream_512_512_s_fu_111_ap_start() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && 
         esl_seteq<1,1,1>(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read(), ap_const_logic_1))) {
        call_ret_read_stream_512_512_s_fu_111_ap_start = ap_const_logic_1;
    } else {
        call_ret_read_stream_512_512_s_fu_111_ap_start = ap_const_logic_0;
    }
}

void example_stream_plus1_512_512_s::thread_p_Result_4_10_i_fu_305_p4() {
    p_Result_4_10_i_fu_305_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(383, 352);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_11_i_fu_321_p4() {
    p_Result_4_11_i_fu_321_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(415, 384);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_12_i_fu_337_p4() {
    p_Result_4_12_i_fu_337_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(447, 416);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_13_i_fu_353_p4() {
    p_Result_4_13_i_fu_353_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(479, 448);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_14_i_fu_369_p4() {
    p_Result_4_14_i_fu_369_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(511, 480);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_1_i_fu_145_p4() {
    p_Result_4_1_i_fu_145_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(63, 32);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_2_i_fu_161_p4() {
    p_Result_4_2_i_fu_161_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(95, 64);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_3_i_fu_177_p4() {
    p_Result_4_3_i_fu_177_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(127, 96);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_4_i_fu_193_p4() {
    p_Result_4_4_i_fu_193_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(159, 128);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_5_i_fu_209_p4() {
    p_Result_4_5_i_fu_209_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(191, 160);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_6_i_fu_225_p4() {
    p_Result_4_6_i_fu_225_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(223, 192);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_7_i_fu_241_p4() {
    p_Result_4_7_i_fu_241_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(255, 224);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_8_i_fu_257_p4() {
    p_Result_4_8_i_fu_257_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(287, 256);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_9_i_fu_273_p4() {
    p_Result_4_9_i_fu_273_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(319, 288);
}

void example_stream_plus1_512_512_s::thread_p_Result_4_i_fu_289_p4() {
    p_Result_4_i_fu_289_p4 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(351, 320);
}

void example_stream_plus1_512_512_s::thread_trunc_ln647_fu_135_p1() {
    trunc_ln647_fu_135_p1 = call_ret_read_stream_512_512_s_fu_111_ap_return_0.read().range(32-1, 0);
}

void example_stream_plus1_512_512_s::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_fsm_state3;
            break;
        case 4 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read()) || esl_seteq<1,1,1>(ap_const_logic_0, call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read())) && esl_seteq<1,1,1>(acc_last_V_fu_130_p1.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n.read()) || esl_seteq<1,1,1>(ap_const_logic_0, call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n.read())) && esl_seteq<1,1,1>(acc_last_V_fu_130_p1.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state4;
            } else {
                ap_NS_fsm = ap_ST_fsm_state3;
            }
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        default : 
            ap_NS_fsm = "XXXX";
            break;
    }
}

}

