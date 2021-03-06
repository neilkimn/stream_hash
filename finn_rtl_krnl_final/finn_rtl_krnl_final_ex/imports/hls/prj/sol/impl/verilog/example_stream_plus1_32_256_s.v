// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_stream_plus1_32_256_s (
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
        axis00_TDATA,
        axis00_TVALID,
        axis00_TREADY,
        axis00_TKEEP,
        axis00_TLAST
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

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
output  [255:0] axis00_TDATA;
output   axis00_TVALID;
input   axis00_TREADY;
output  [31:0] axis00_TKEEP;
output  [0:0] axis00_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg axis01_TREADY;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n;
reg    axis01_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n;
reg    axis00_TDATA_blk_n;
wire    grp_read_stream_32_256_s_fu_70_ap_start;
wire    grp_read_stream_32_256_s_fu_70_ap_done;
wire    grp_read_stream_32_256_s_fu_70_ap_idle;
wire    grp_read_stream_32_256_s_fu_70_ap_ready;
wire    grp_read_stream_32_256_s_fu_70_axis01_TREADY;
wire   [255:0] grp_read_stream_32_256_s_fu_70_ap_return_0;
wire   [31:0] grp_read_stream_32_256_s_fu_70_ap_return_1;
wire   [0:0] grp_read_stream_32_256_s_fu_70_ap_return_2;
reg    grp_read_stream_32_256_s_fu_70_ap_ce;
reg    ap_block_state10;
reg    call_ln100_write_stream_256_256_s_fu_81_ap_start;
wire    call_ln100_write_stream_256_256_s_fu_81_ap_done;
wire    call_ln100_write_stream_256_256_s_fu_81_ap_idle;
wire    call_ln100_write_stream_256_256_s_fu_81_ap_ready;
wire   [255:0] call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read;
wire   [255:0] call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA;
wire    call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID;
wire    call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY;
wire   [31:0] call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP;
wire   [0:0] call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST;
reg    call_ln100_write_stream_256_256_s_fu_81_ap_ce;
reg    grp_read_stream_32_256_s_fu_70_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [10:0] ap_NS_fsm;
wire    ap_NS_fsm_state3;
wire   [255:0] acc_data_V_fu_234_p9;
wire   [0:0] acc_last_V_fu_107_p1;
reg   [255:0] acc_data_V_2_fu_66;
wire   [31:0] trunc_ln647_fu_112_p1;
wire   [31:0] p_Result_4_1_i_fu_122_p4;
wire   [31:0] p_Result_4_2_i_fu_138_p4;
wire   [31:0] p_Result_4_3_i_fu_154_p4;
wire   [31:0] p_Result_4_4_i_fu_170_p4;
wire   [31:0] p_Result_4_5_i_fu_186_p4;
wire   [31:0] p_Result_4_6_i_fu_202_p4;
wire   [31:0] p_Result_4_7_i_fu_218_p4;
wire   [31:0] add_ln215_7_fu_228_p2;
wire   [31:0] add_ln215_6_fu_212_p2;
wire   [31:0] add_ln215_5_fu_196_p2;
wire   [31:0] add_ln215_4_fu_180_p2;
wire   [31:0] add_ln215_3_fu_164_p2;
wire   [31:0] add_ln215_2_fu_148_p2;
wire   [31:0] add_ln215_1_fu_132_p2;
wire   [31:0] add_ln215_fu_116_p2;
wire    ap_CS_fsm_state11;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
#0 grp_read_stream_32_256_s_fu_70_ap_start_reg = 1'b0;
end

read_stream_32_256_s grp_read_stream_32_256_s_fu_70(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_read_stream_32_256_s_fu_70_ap_start),
    .ap_done(grp_read_stream_32_256_s_fu_70_ap_done),
    .ap_idle(grp_read_stream_32_256_s_fu_70_ap_idle),
    .ap_ready(grp_read_stream_32_256_s_fu_70_ap_ready),
    .axis01_TDATA(axis01_TDATA),
    .axis01_TVALID(axis01_TVALID),
    .axis01_TREADY(grp_read_stream_32_256_s_fu_70_axis01_TREADY),
    .axis01_TKEEP(axis01_TKEEP),
    .axis01_TLAST(axis01_TLAST),
    .acc_data_V_read(acc_data_V_2_fu_66),
    .ap_return_0(grp_read_stream_32_256_s_fu_70_ap_return_0),
    .ap_return_1(grp_read_stream_32_256_s_fu_70_ap_return_1),
    .ap_return_2(grp_read_stream_32_256_s_fu_70_ap_return_2),
    .axis01_TDATA_blk_n(grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n),
    .ap_ce(grp_read_stream_32_256_s_fu_70_ap_ce)
);

write_stream_256_256_s call_ln100_write_stream_256_256_s_fu_81(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(call_ln100_write_stream_256_256_s_fu_81_ap_start),
    .ap_done(call_ln100_write_stream_256_256_s_fu_81_ap_done),
    .ap_idle(call_ln100_write_stream_256_256_s_fu_81_ap_idle),
    .ap_ready(call_ln100_write_stream_256_256_s_fu_81_ap_ready),
    .acc_data_V_read(call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read),
    .acc_keep_V_read(grp_read_stream_32_256_s_fu_70_ap_return_1),
    .acc_last_V_read(grp_read_stream_32_256_s_fu_70_ap_return_2),
    .axis00_TDATA(call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA),
    .axis00_TVALID(call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID),
    .axis00_TREADY(call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY),
    .axis00_TKEEP(call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP),
    .axis00_TLAST(call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST),
    .axis00_TDATA_blk_n(call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n),
    .ap_ce(call_ln100_write_stream_256_256_s_fu_81_ap_ce)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_read_stream_32_256_s_fu_70_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state3) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_read_stream_32_256_s_fu_70_ap_start_reg <= 1'b1;
        end else if ((grp_read_stream_32_256_s_fu_70_ap_ready == 1'b1)) begin
            grp_read_stream_32_256_s_fu_70_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n == 1'b0) | (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b0)) & (1'b1 == ap_CS_fsm_state10))) begin
        acc_data_V_2_fu_66 <= acc_data_V_fu_234_p9;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if ((1'b1 == ap_CS_fsm_state11)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        axis00_TDATA_blk_n = call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n;
    end else begin
        axis00_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        axis01_TDATA_blk_n = grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n;
    end else begin
        axis01_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        axis01_TREADY = grp_read_stream_32_256_s_fu_70_axis01_TREADY;
    end else begin
        axis01_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        call_ln100_write_stream_256_256_s_fu_81_ap_ce = 1'b1;
    end else begin
        call_ln100_write_stream_256_256_s_fu_81_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        call_ln100_write_stream_256_256_s_fu_81_ap_start = 1'b1;
    end else begin
        call_ln100_write_stream_256_256_s_fu_81_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state10)))) begin
        grp_read_stream_32_256_s_fu_70_ap_ce = 1'b1;
    end else begin
        grp_read_stream_32_256_s_fu_70_ap_ce = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if ((~((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n == 1'b0) | (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b0)) & (1'b1 == ap_CS_fsm_state10) & (1'd0 == acc_last_V_fu_107_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n == 1'b0) | (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b0)) & (1'b1 == ap_CS_fsm_state10) & (1'd1 == acc_last_V_fu_107_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_data_V_fu_234_p9 = {{{{{{{{add_ln215_7_fu_228_p2}, {add_ln215_6_fu_212_p2}}, {add_ln215_5_fu_196_p2}}, {add_ln215_4_fu_180_p2}}, {add_ln215_3_fu_164_p2}}, {add_ln215_2_fu_148_p2}}, {add_ln215_1_fu_132_p2}}, {add_ln215_fu_116_p2}};

assign acc_last_V_fu_107_p1 = grp_read_stream_32_256_s_fu_70_ap_return_2;

assign add_ln215_1_fu_132_p2 = (32'd1 + p_Result_4_1_i_fu_122_p4);

assign add_ln215_2_fu_148_p2 = (32'd1 + p_Result_4_2_i_fu_138_p4);

assign add_ln215_3_fu_164_p2 = (32'd1 + p_Result_4_3_i_fu_154_p4);

assign add_ln215_4_fu_180_p2 = (32'd1 + p_Result_4_4_i_fu_170_p4);

assign add_ln215_5_fu_196_p2 = (32'd1 + p_Result_4_5_i_fu_186_p4);

assign add_ln215_6_fu_212_p2 = (32'd1 + p_Result_4_6_i_fu_202_p4);

assign add_ln215_7_fu_228_p2 = (32'd1 + p_Result_4_7_i_fu_218_p4);

assign add_ln215_fu_116_p2 = (32'd1 + trunc_ln647_fu_112_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_NS_fsm_state3 = ap_NS_fsm[32'd2];

always @ (*) begin
    ap_block_state10 = ((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n == 1'b0) | (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n == 1'b0));
end

assign axis00_TDATA = call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA;

assign axis00_TKEEP = call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP;

assign axis00_TLAST = call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST;

assign axis00_TVALID = call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID;

assign call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read = {{{{{{{{add_ln215_7_fu_228_p2}, {add_ln215_6_fu_212_p2}}, {add_ln215_5_fu_196_p2}}, {add_ln215_4_fu_180_p2}}, {add_ln215_3_fu_164_p2}}, {add_ln215_2_fu_148_p2}}, {add_ln215_1_fu_132_p2}}, {add_ln215_fu_116_p2}};

assign call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY = (axis00_TREADY & ap_CS_fsm_state10);

assign grp_read_stream_32_256_s_fu_70_ap_start = grp_read_stream_32_256_s_fu_70_ap_start_reg;

assign p_Result_4_1_i_fu_122_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[63:32]}};

assign p_Result_4_2_i_fu_138_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[95:64]}};

assign p_Result_4_3_i_fu_154_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[127:96]}};

assign p_Result_4_4_i_fu_170_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[159:128]}};

assign p_Result_4_5_i_fu_186_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[191:160]}};

assign p_Result_4_6_i_fu_202_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[223:192]}};

assign p_Result_4_7_i_fu_218_p4 = {{grp_read_stream_32_256_s_fu_70_ap_return_0[255:224]}};

assign trunc_ln647_fu_112_p1 = grp_read_stream_32_256_s_fu_70_ap_return_0[31:0];

endmodule //example_stream_plus1_32_256_s
