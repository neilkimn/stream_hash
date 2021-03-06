// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _read_stream_32_256_s_HH_
#define _read_stream_32_256_s_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct read_stream_32_256_s : public sc_module {
    // Port declarations 17
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<32> > axis01_TDATA;
    sc_in< sc_logic > axis01_TVALID;
    sc_out< sc_logic > axis01_TREADY;
    sc_in< sc_lv<4> > axis01_TKEEP;
    sc_in< sc_lv<1> > axis01_TLAST;
    sc_in< sc_lv<256> > acc_data_V_read;
    sc_out< sc_lv<256> > ap_return_0;
    sc_out< sc_lv<32> > ap_return_1;
    sc_out< sc_lv<1> > ap_return_2;
    sc_out< sc_logic > axis01_TDATA_blk_n;
    sc_in< sc_logic > ap_ce;


    // Module declarations
    read_stream_32_256_s(sc_module_name name);
    SC_HAS_PROCESS(read_stream_32_256_s);

    ~read_stream_32_256_s();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<8> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<1> > tmp_last_V_reg_386;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_lv<1> > tmp_last_V_1_reg_418;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<1> > tmp_last_V_2_reg_449;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<1> > tmp_last_V_3_reg_479;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<1> > tmp_last_V_4_reg_508;
    sc_signal< sc_logic > ap_CS_fsm_state7;
    sc_signal< sc_lv<1> > tmp_last_V_5_reg_536;
    sc_signal< sc_logic > ap_CS_fsm_state8;
    sc_signal< sc_lv<1> > tmp_last_V_6_reg_560;
    sc_signal< sc_lv<32> > tmp_data_V_reg_368;
    sc_signal< bool > ap_block_state1;
    sc_signal< sc_lv<4> > tmp_keep_V_reg_374;
    sc_signal< sc_lv<1> > grp_fu_165_p1;
    sc_signal< sc_lv<256> > p_Result_s_fu_170_p5;
    sc_signal< sc_lv<256> > p_Result_s_reg_390;
    sc_signal< bool > ap_block_state2;
    sc_signal< sc_lv<32> > zext_ln414_fu_181_p1;
    sc_signal< sc_lv<32> > tmp_data_V_1_reg_401;
    sc_signal< sc_lv<4> > tmp_keep_V_1_reg_407;
    sc_signal< sc_lv<256> > p_Result_1_fu_184_p5;
    sc_signal< sc_lv<256> > p_Result_1_reg_422;
    sc_signal< bool > ap_predicate_op26_read_state3;
    sc_signal< bool > ap_block_state3;
    sc_signal< sc_lv<32> > zext_ln414_1_fu_200_p1;
    sc_signal< sc_lv<32> > tmp_data_V_2_reg_433;
    sc_signal< sc_lv<4> > tmp_keep_V_2_reg_439;
    sc_signal< sc_lv<256> > p_Result_s_10_fu_204_p5;
    sc_signal< sc_lv<256> > p_Result_s_10_reg_453;
    sc_signal< bool > ap_predicate_op34_read_state4;
    sc_signal< bool > ap_block_state4;
    sc_signal< sc_lv<32> > zext_ln414_2_fu_221_p1;
    sc_signal< sc_lv<32> > tmp_data_V_3_reg_464;
    sc_signal< sc_lv<4> > tmp_keep_V_3_reg_470;
    sc_signal< sc_lv<256> > p_Result_3_fu_225_p5;
    sc_signal< sc_lv<256> > p_Result_3_reg_483;
    sc_signal< bool > ap_predicate_op42_read_state5;
    sc_signal< bool > ap_block_state5;
    sc_signal< sc_lv<32> > zext_ln414_3_fu_243_p1;
    sc_signal< sc_lv<32> > tmp_data_V_4_reg_494;
    sc_signal< sc_lv<4> > tmp_keep_V_4_reg_500;
    sc_signal< sc_lv<256> > p_Result_4_fu_247_p5;
    sc_signal< sc_lv<256> > p_Result_4_reg_512;
    sc_signal< bool > ap_predicate_op50_read_state6;
    sc_signal< bool > ap_block_state6;
    sc_signal< sc_lv<32> > zext_ln414_4_fu_266_p1;
    sc_signal< sc_lv<32> > tmp_data_V_5_reg_523;
    sc_signal< sc_lv<4> > tmp_keep_V_5_reg_529;
    sc_signal< sc_lv<256> > p_Result_5_fu_270_p5;
    sc_signal< bool > ap_predicate_op58_read_state7;
    sc_signal< bool > ap_block_state7;
    sc_signal< sc_lv<32> > zext_ln414_5_fu_290_p1;
    sc_signal< sc_lv<32> > tmp_data_V_6_reg_550;
    sc_signal< sc_lv<4> > tmp_keep_V_6_reg_555;
    sc_signal< sc_lv<256> > p_Result_6_fu_294_p5;
    sc_signal< sc_lv<32> > zext_ln414_6_fu_318_p1;
    sc_signal< sc_lv<256> > ap_port_reg_acc_data_V_read;
    sc_signal< sc_lv<32> > ap_phi_mux_acc_keep_V_1_phi_fu_89_p16;
    sc_signal< sc_lv<32> > acc_keep_V_1_reg_86;
    sc_signal< sc_lv<32> > p_Result_2_7_fu_336_p9;
    sc_signal< bool > ap_predicate_op66_read_state8;
    sc_signal< bool > ap_block_state8;
    sc_signal< sc_lv<256> > ap_phi_mux_acc_data_V_1_phi_fu_110_p16;
    sc_signal< sc_lv<256> > acc_data_V_1_reg_107;
    sc_signal< sc_lv<256> > p_Result_7_fu_322_p9;
    sc_signal< sc_lv<1> > ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16;
    sc_signal< sc_lv<1> > acc_last_V_write_assign_reg_128;
    sc_signal< sc_lv<8> > tmp_fu_194_p3;
    sc_signal< sc_lv<12> > tmp_1_fu_214_p4;
    sc_signal< sc_lv<16> > tmp_2_fu_235_p5;
    sc_signal< sc_lv<20> > tmp_3_fu_257_p6;
    sc_signal< sc_lv<24> > tmp_4_fu_280_p7;
    sc_signal< sc_lv<28> > tmp_5_fu_306_p8;
    sc_signal< sc_lv<8> > ap_NS_fsm;
    sc_signal< bool > ap_condition_497;
    sc_signal< bool > ap_condition_502;
    sc_signal< bool > ap_condition_507;
    sc_signal< bool > ap_condition_512;
    sc_signal< bool > ap_condition_517;
    sc_signal< bool > ap_condition_522;
    sc_signal< bool > ap_condition_526;
    sc_signal< bool > ap_condition_530;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<8> ap_ST_fsm_state1;
    static const sc_lv<8> ap_ST_fsm_state2;
    static const sc_lv<8> ap_ST_fsm_state3;
    static const sc_lv<8> ap_ST_fsm_state4;
    static const sc_lv<8> ap_ST_fsm_state5;
    static const sc_lv<8> ap_ST_fsm_state6;
    static const sc_lv<8> ap_ST_fsm_state7;
    static const sc_lv<8> ap_ST_fsm_state8;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_3F;
    static const sc_lv<32> ap_const_lv32_40;
    static const sc_lv<32> ap_const_lv32_5F;
    static const sc_lv<32> ap_const_lv32_60;
    static const sc_lv<32> ap_const_lv32_7F;
    static const sc_lv<32> ap_const_lv32_80;
    static const sc_lv<32> ap_const_lv32_9F;
    static const sc_lv<32> ap_const_lv32_A0;
    static const sc_lv<32> ap_const_lv32_BF;
    static const sc_lv<32> ap_const_lv32_C0;
    static const sc_lv<32> ap_const_lv32_DF;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_CS_fsm_state6();
    void thread_ap_CS_fsm_state7();
    void thread_ap_CS_fsm_state8();
    void thread_ap_block_state1();
    void thread_ap_block_state2();
    void thread_ap_block_state3();
    void thread_ap_block_state4();
    void thread_ap_block_state5();
    void thread_ap_block_state6();
    void thread_ap_block_state7();
    void thread_ap_block_state8();
    void thread_ap_condition_497();
    void thread_ap_condition_502();
    void thread_ap_condition_507();
    void thread_ap_condition_512();
    void thread_ap_condition_517();
    void thread_ap_condition_522();
    void thread_ap_condition_526();
    void thread_ap_condition_530();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_phi_mux_acc_data_V_1_phi_fu_110_p16();
    void thread_ap_phi_mux_acc_keep_V_1_phi_fu_89_p16();
    void thread_ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16();
    void thread_ap_predicate_op26_read_state3();
    void thread_ap_predicate_op34_read_state4();
    void thread_ap_predicate_op42_read_state5();
    void thread_ap_predicate_op50_read_state6();
    void thread_ap_predicate_op58_read_state7();
    void thread_ap_predicate_op66_read_state8();
    void thread_ap_ready();
    void thread_ap_return_0();
    void thread_ap_return_1();
    void thread_ap_return_2();
    void thread_axis01_TDATA_blk_n();
    void thread_axis01_TREADY();
    void thread_grp_fu_165_p1();
    void thread_p_Result_1_fu_184_p5();
    void thread_p_Result_2_7_fu_336_p9();
    void thread_p_Result_3_fu_225_p5();
    void thread_p_Result_4_fu_247_p5();
    void thread_p_Result_5_fu_270_p5();
    void thread_p_Result_6_fu_294_p5();
    void thread_p_Result_7_fu_322_p9();
    void thread_p_Result_s_10_fu_204_p5();
    void thread_p_Result_s_fu_170_p5();
    void thread_tmp_1_fu_214_p4();
    void thread_tmp_2_fu_235_p5();
    void thread_tmp_3_fu_257_p6();
    void thread_tmp_4_fu_280_p7();
    void thread_tmp_5_fu_306_p8();
    void thread_tmp_fu_194_p3();
    void thread_zext_ln414_1_fu_200_p1();
    void thread_zext_ln414_2_fu_221_p1();
    void thread_zext_ln414_3_fu_243_p1();
    void thread_zext_ln414_4_fu_266_p1();
    void thread_zext_ln414_5_fu_290_p1();
    void thread_zext_ln414_6_fu_318_p1();
    void thread_zext_ln414_fu_181_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
