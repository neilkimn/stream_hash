// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module read_stream_32_256_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        axis01_TDATA,
        axis01_TVALID,
        axis01_TREADY,
        axis01_TKEEP,
        axis01_TLAST,
        acc_data_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        axis01_TDATA_blk_n,
        ap_ce
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] axis01_TDATA;
input   axis01_TVALID;
output   axis01_TREADY;
input  [3:0] axis01_TKEEP;
input  [0:0] axis01_TLAST;
input  [255:0] acc_data_V_read;
output  [255:0] ap_return_0;
output  [31:0] ap_return_1;
output  [0:0] ap_return_2;
output   axis01_TDATA_blk_n;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg axis01_TREADY;
reg axis01_TDATA_blk_n;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
reg   [0:0] tmp_last_V_reg_386;
wire    ap_CS_fsm_state3;
reg   [0:0] tmp_last_V_1_reg_418;
wire    ap_CS_fsm_state4;
reg   [0:0] tmp_last_V_2_reg_449;
wire    ap_CS_fsm_state5;
reg   [0:0] tmp_last_V_3_reg_479;
wire    ap_CS_fsm_state6;
reg   [0:0] tmp_last_V_4_reg_508;
wire    ap_CS_fsm_state7;
reg   [0:0] tmp_last_V_5_reg_536;
wire    ap_CS_fsm_state8;
reg   [0:0] tmp_last_V_6_reg_560;
reg   [31:0] tmp_data_V_reg_368;
reg    ap_block_state1;
reg   [3:0] tmp_keep_V_reg_374;
wire   [0:0] grp_fu_165_p1;
wire   [255:0] p_Result_s_fu_170_p5;
reg   [255:0] p_Result_s_reg_390;
reg    ap_block_state2;
wire   [31:0] zext_ln414_fu_181_p1;
reg   [31:0] tmp_data_V_1_reg_401;
reg   [3:0] tmp_keep_V_1_reg_407;
wire   [255:0] p_Result_1_fu_184_p5;
reg   [255:0] p_Result_1_reg_422;
reg    ap_predicate_op26_read_state3;
reg    ap_block_state3;
wire   [31:0] zext_ln414_1_fu_200_p1;
reg   [31:0] tmp_data_V_2_reg_433;
reg   [3:0] tmp_keep_V_2_reg_439;
wire   [255:0] p_Result_s_10_fu_204_p5;
reg   [255:0] p_Result_s_10_reg_453;
reg    ap_predicate_op34_read_state4;
reg    ap_block_state4;
wire   [31:0] zext_ln414_2_fu_221_p1;
reg   [31:0] tmp_data_V_3_reg_464;
reg   [3:0] tmp_keep_V_3_reg_470;
wire   [255:0] p_Result_3_fu_225_p5;
reg   [255:0] p_Result_3_reg_483;
reg    ap_predicate_op42_read_state5;
reg    ap_block_state5;
wire   [31:0] zext_ln414_3_fu_243_p1;
reg   [31:0] tmp_data_V_4_reg_494;
reg   [3:0] tmp_keep_V_4_reg_500;
wire   [255:0] p_Result_4_fu_247_p5;
reg   [255:0] p_Result_4_reg_512;
reg    ap_predicate_op50_read_state6;
reg    ap_block_state6;
wire   [31:0] zext_ln414_4_fu_266_p1;
reg   [31:0] tmp_data_V_5_reg_523;
reg   [3:0] tmp_keep_V_5_reg_529;
wire   [255:0] p_Result_5_fu_270_p5;
reg    ap_predicate_op58_read_state7;
reg    ap_block_state7;
wire   [31:0] zext_ln414_5_fu_290_p1;
reg   [31:0] tmp_data_V_6_reg_550;
reg   [3:0] tmp_keep_V_6_reg_555;
wire   [255:0] p_Result_6_fu_294_p5;
wire   [31:0] zext_ln414_6_fu_318_p1;
reg   [255:0] ap_port_reg_acc_data_V_read;
reg   [31:0] ap_phi_mux_acc_keep_V_1_phi_fu_89_p16;
reg   [31:0] acc_keep_V_1_reg_86;
wire   [31:0] p_Result_2_7_fu_336_p9;
reg    ap_predicate_op66_read_state8;
reg    ap_block_state8;
reg   [255:0] ap_phi_mux_acc_data_V_1_phi_fu_110_p16;
reg   [255:0] acc_data_V_1_reg_107;
wire   [255:0] p_Result_7_fu_322_p9;
reg   [0:0] ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16;
reg   [0:0] acc_last_V_write_assign_reg_128;
wire   [7:0] tmp_fu_194_p3;
wire   [11:0] tmp_1_fu_214_p4;
wire   [15:0] tmp_2_fu_235_p5;
wire   [19:0] tmp_3_fu_257_p6;
wire   [23:0] tmp_4_fu_280_p7;
wire   [27:0] tmp_5_fu_306_p8;
reg   [7:0] ap_NS_fsm;
reg    ap_condition_497;
reg    ap_condition_502;
reg    ap_condition_507;
reg    ap_condition_512;
reg    ap_condition_517;
reg    ap_condition_522;
reg    ap_condition_526;
reg    ap_condition_530;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        if ((1'b1 == ap_condition_530)) begin
            acc_data_V_1_reg_107 <= p_Result_7_fu_322_p9;
        end else if ((1'b1 == ap_condition_526)) begin
            acc_data_V_1_reg_107 <= p_Result_6_fu_294_p5;
        end else if ((1'b1 == ap_condition_522)) begin
            acc_data_V_1_reg_107 <= p_Result_5_fu_270_p5;
        end else if ((1'b1 == ap_condition_517)) begin
            acc_data_V_1_reg_107 <= p_Result_4_fu_247_p5;
        end else if ((1'b1 == ap_condition_512)) begin
            acc_data_V_1_reg_107 <= p_Result_3_fu_225_p5;
        end else if ((1'b1 == ap_condition_507)) begin
            acc_data_V_1_reg_107 <= p_Result_s_10_fu_204_p5;
        end else if ((1'b1 == ap_condition_502)) begin
            acc_data_V_1_reg_107 <= p_Result_1_fu_184_p5;
        end else if ((1'b1 == ap_condition_497)) begin
            acc_data_V_1_reg_107 <= p_Result_s_fu_170_p5;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        if ((1'b1 == ap_condition_530)) begin
            acc_keep_V_1_reg_86 <= p_Result_2_7_fu_336_p9;
        end else if ((1'b1 == ap_condition_526)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_6_fu_318_p1;
        end else if ((1'b1 == ap_condition_522)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_5_fu_290_p1;
        end else if ((1'b1 == ap_condition_517)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_4_fu_266_p1;
        end else if ((1'b1 == ap_condition_512)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_3_fu_243_p1;
        end else if ((1'b1 == ap_condition_507)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_2_fu_221_p1;
        end else if ((1'b1 == ap_condition_502)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_1_fu_200_p1;
        end else if ((1'b1 == ap_condition_497)) begin
            acc_keep_V_1_reg_86 <= zext_ln414_fu_181_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8) & (1'b1 == ap_ce))) begin
        acc_last_V_write_assign_reg_128 <= axis01_TLAST;
    end else if (((~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7) & (grp_fu_165_p1 == 1'd1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd1) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (tmp_last_V_4_reg_508 == 1'd1) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state6) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (tmp_last_V_3_reg_479 == 1'd1) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (tmp_last_V_2_reg_449 == 1'd1) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (tmp_last_V_1_reg_418 == 1'd1) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_ce)) | (~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (tmp_last_V_reg_386 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce)))) begin
        acc_last_V_write_assign_reg_128 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (1'b1 == ap_ce))) begin
        ap_port_reg_acc_data_V_read <= acc_data_V_read;
        tmp_data_V_reg_368 <= axis01_TDATA;
        tmp_keep_V_reg_374 <= axis01_TKEEP;
        tmp_last_V_reg_386 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_ce))) begin
        p_Result_1_reg_422 <= p_Result_1_fu_184_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b1 == ap_ce))) begin
        p_Result_3_reg_483 <= p_Result_3_fu_225_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state6) & (1'b1 == ap_ce))) begin
        p_Result_4_reg_512 <= p_Result_4_fu_247_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (1'b1 == ap_ce))) begin
        p_Result_s_10_reg_453 <= p_Result_s_10_fu_204_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce))) begin
        p_Result_s_reg_390 <= p_Result_s_fu_170_p5;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce))) begin
        tmp_data_V_1_reg_401 <= axis01_TDATA;
        tmp_keep_V_1_reg_407 <= axis01_TKEEP;
        tmp_last_V_1_reg_418 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_ce))) begin
        tmp_data_V_2_reg_433 <= axis01_TDATA;
        tmp_keep_V_2_reg_439 <= axis01_TKEEP;
        tmp_last_V_2_reg_449 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (1'b1 == ap_ce))) begin
        tmp_data_V_3_reg_464 <= axis01_TDATA;
        tmp_keep_V_3_reg_470 <= axis01_TKEEP;
        tmp_last_V_3_reg_479 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (1'b1 == ap_ce))) begin
        tmp_data_V_4_reg_494 <= axis01_TDATA;
        tmp_keep_V_4_reg_500 <= axis01_TKEEP;
        tmp_last_V_4_reg_508 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state6) & (1'b1 == ap_ce))) begin
        tmp_data_V_5_reg_523 <= axis01_TDATA;
        tmp_keep_V_5_reg_529 <= axis01_TKEEP;
        tmp_last_V_5_reg_536 <= axis01_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7) & (1'b1 == ap_ce))) begin
        tmp_data_V_6_reg_550 <= axis01_TDATA;
        tmp_keep_V_6_reg_555 <= axis01_TKEEP;
        tmp_last_V_6_reg_560 <= axis01_TLAST;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (1'b1 == ap_CS_fsm_state8) & (1'b1 == ap_ce)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_acc_data_V_1_phi_fu_110_p16 = p_Result_7_fu_322_p9;
    end else begin
        ap_phi_mux_acc_data_V_1_phi_fu_110_p16 = acc_data_V_1_reg_107;
    end
end

always @ (*) begin
    if (((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_acc_keep_V_1_phi_fu_89_p16 = p_Result_2_7_fu_336_p9;
    end else begin
        ap_phi_mux_acc_keep_V_1_phi_fu_89_p16 = acc_keep_V_1_reg_86;
    end
end

always @ (*) begin
    if (((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16 = axis01_TLAST;
    end else begin
        ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16 = acc_last_V_write_assign_reg_128;
    end
end

always @ (*) begin
    if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (1'b1 == ap_CS_fsm_state8) & (1'b1 == ap_ce))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) | ((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7)) | ((tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) | ((tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state5)) | ((tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) | ((tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        axis01_TDATA_blk_n = axis01_TVALID;
    end else begin
        axis01_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (1'b1 == ap_CS_fsm_state7) & (ap_predicate_op58_read_state7 == 1'b1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (1'b1 == ap_CS_fsm_state6) & (ap_predicate_op50_read_state6 == 1'b1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (1'b1 == ap_CS_fsm_state5) & (ap_predicate_op42_read_state5 == 1'b1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (1'b1 == ap_CS_fsm_state4) & (ap_predicate_op34_read_state4 == 1'b1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (1'b1 == ap_CS_fsm_state3) & (ap_predicate_op26_read_state3 == 1'b1) & (1'b1 == ap_ce)) | (~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (1'b1 == ap_ce)) | (~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (1'b1 == ap_CS_fsm_state8) & (ap_predicate_op66_read_state8 == 1'b1) & (1'b1 == ap_ce)))) begin
        axis01_TREADY = 1'b1;
    end else begin
        axis01_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((axis01_TVALID == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (1'b1 == ap_CS_fsm_state4) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (1'b1 == ap_CS_fsm_state5) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (1'b1 == ap_CS_fsm_state6) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (1'b1 == ap_CS_fsm_state7) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if ((~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (1'b1 == ap_CS_fsm_state8) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((axis01_TVALID == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0));
end

always @ (*) begin
    ap_block_state3 = ((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1));
end

always @ (*) begin
    ap_block_state4 = ((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1));
end

always @ (*) begin
    ap_block_state5 = ((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1));
end

always @ (*) begin
    ap_block_state6 = ((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1));
end

always @ (*) begin
    ap_block_state7 = ((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1));
end

always @ (*) begin
    ap_block_state8 = ((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1));
end

always @ (*) begin
    ap_condition_497 = (~((tmp_last_V_reg_386 == 1'd0) & (axis01_TVALID == 1'b0)) & (tmp_last_V_reg_386 == 1'd1) & (1'b1 == ap_CS_fsm_state2));
end

always @ (*) begin
    ap_condition_502 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op26_read_state3 == 1'b1)) & (tmp_last_V_1_reg_418 == 1'd1) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state3));
end

always @ (*) begin
    ap_condition_507 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op34_read_state4 == 1'b1)) & (tmp_last_V_2_reg_449 == 1'd1) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state4));
end

always @ (*) begin
    ap_condition_512 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op42_read_state5 == 1'b1)) & (tmp_last_V_3_reg_479 == 1'd1) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state5));
end

always @ (*) begin
    ap_condition_517 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op50_read_state6 == 1'b1)) & (tmp_last_V_4_reg_508 == 1'd1) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state6));
end

always @ (*) begin
    ap_condition_522 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd1) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7));
end

always @ (*) begin
    ap_condition_526 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op58_read_state7 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state7) & (grp_fu_165_p1 == 1'd1));
end

always @ (*) begin
    ap_condition_530 = (~((axis01_TVALID == 1'b0) & (ap_predicate_op66_read_state8 == 1'b1)) & (tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0) & (1'b1 == ap_CS_fsm_state8));
end

always @ (*) begin
    ap_predicate_op26_read_state3 = ((tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

always @ (*) begin
    ap_predicate_op34_read_state4 = ((tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

always @ (*) begin
    ap_predicate_op42_read_state5 = ((tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

always @ (*) begin
    ap_predicate_op50_read_state6 = ((tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

always @ (*) begin
    ap_predicate_op58_read_state7 = ((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

always @ (*) begin
    ap_predicate_op66_read_state8 = ((tmp_last_V_5_reg_536 == 1'd0) & (tmp_last_V_4_reg_508 == 1'd0) & (tmp_last_V_3_reg_479 == 1'd0) & (tmp_last_V_2_reg_449 == 1'd0) & (tmp_last_V_1_reg_418 == 1'd0) & (tmp_last_V_6_reg_560 == 1'd0) & (tmp_last_V_reg_386 == 1'd0));
end

assign ap_return_0 = ap_phi_mux_acc_data_V_1_phi_fu_110_p16;

assign ap_return_1 = ap_phi_mux_acc_keep_V_1_phi_fu_89_p16;

assign ap_return_2 = ap_phi_mux_acc_last_V_write_assign_phi_fu_132_p16;

assign grp_fu_165_p1 = axis01_TLAST;

assign p_Result_1_fu_184_p5 = {{p_Result_s_reg_390[255:64]}, {tmp_data_V_1_reg_401}, {p_Result_s_reg_390[31:0]}};

assign p_Result_2_7_fu_336_p9 = {{{{{{{{axis01_TKEEP}, {tmp_keep_V_6_reg_555}}, {tmp_keep_V_5_reg_529}}, {tmp_keep_V_4_reg_500}}, {tmp_keep_V_3_reg_470}}, {tmp_keep_V_2_reg_439}}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign p_Result_3_fu_225_p5 = {{p_Result_s_10_reg_453[255:128]}, {tmp_data_V_3_reg_464}, {p_Result_s_10_reg_453[95:0]}};

assign p_Result_4_fu_247_p5 = {{p_Result_3_reg_483[255:160]}, {tmp_data_V_4_reg_494}, {p_Result_3_reg_483[127:0]}};

assign p_Result_5_fu_270_p5 = {{p_Result_4_reg_512[255:192]}, {tmp_data_V_5_reg_523}, {p_Result_4_reg_512[159:0]}};

assign p_Result_6_fu_294_p5 = {{p_Result_5_fu_270_p5[255:224]}, {axis01_TDATA}, {p_Result_5_fu_270_p5[191:0]}};

assign p_Result_7_fu_322_p9 = {{{{{{{{axis01_TDATA}, {tmp_data_V_6_reg_550}}, {tmp_data_V_5_reg_523}}, {tmp_data_V_4_reg_494}}, {tmp_data_V_3_reg_464}}, {tmp_data_V_2_reg_433}}, {tmp_data_V_1_reg_401}}, {tmp_data_V_reg_368}};

assign p_Result_s_10_fu_204_p5 = {{p_Result_1_reg_422[255:96]}, {tmp_data_V_2_reg_433}, {p_Result_1_reg_422[63:0]}};

assign p_Result_s_fu_170_p5 = {{ap_port_reg_acc_data_V_read[255:32]}, {tmp_data_V_reg_368}};

assign tmp_1_fu_214_p4 = {{{tmp_keep_V_2_reg_439}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign tmp_2_fu_235_p5 = {{{{tmp_keep_V_3_reg_470}, {tmp_keep_V_2_reg_439}}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign tmp_3_fu_257_p6 = {{{{{tmp_keep_V_4_reg_500}, {tmp_keep_V_3_reg_470}}, {tmp_keep_V_2_reg_439}}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign tmp_4_fu_280_p7 = {{{{{{tmp_keep_V_5_reg_529}, {tmp_keep_V_4_reg_500}}, {tmp_keep_V_3_reg_470}}, {tmp_keep_V_2_reg_439}}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign tmp_5_fu_306_p8 = {{{{{{{axis01_TKEEP}, {tmp_keep_V_5_reg_529}}, {tmp_keep_V_4_reg_500}}, {tmp_keep_V_3_reg_470}}, {tmp_keep_V_2_reg_439}}, {tmp_keep_V_1_reg_407}}, {tmp_keep_V_reg_374}};

assign tmp_fu_194_p3 = {{tmp_keep_V_1_reg_407}, {tmp_keep_V_reg_374}};

assign zext_ln414_1_fu_200_p1 = tmp_fu_194_p3;

assign zext_ln414_2_fu_221_p1 = tmp_1_fu_214_p4;

assign zext_ln414_3_fu_243_p1 = tmp_2_fu_235_p5;

assign zext_ln414_4_fu_266_p1 = tmp_3_fu_257_p6;

assign zext_ln414_5_fu_290_p1 = tmp_4_fu_280_p7;

assign zext_ln414_6_fu_318_p1 = tmp_5_fu_306_p8;

assign zext_ln414_fu_181_p1 = tmp_keep_V_reg_374;

endmodule //read_stream_32_256_s
