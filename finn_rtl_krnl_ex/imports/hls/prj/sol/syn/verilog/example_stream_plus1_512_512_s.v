// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_stream_plus1_512_512_s (
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

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [511:0] axis01_TDATA;
input   axis01_TVALID;
output   axis01_TREADY;
input  [63:0] axis01_TKEEP;
input  [0:0] axis01_TLAST;
output  [511:0] axis00_TDATA;
output   axis00_TVALID;
input   axis00_TREADY;
output  [63:0] axis00_TKEEP;
output  [0:0] axis00_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg axis01_TREADY;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n;
reg    axis01_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire    call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n;
reg    axis00_TDATA_blk_n;
reg    call_ln100_write_stream_512_512_s_fu_98_ap_start;
wire    call_ln100_write_stream_512_512_s_fu_98_ap_done;
wire    call_ln100_write_stream_512_512_s_fu_98_ap_idle;
wire    call_ln100_write_stream_512_512_s_fu_98_ap_ready;
wire   [511:0] call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read;
wire   [511:0] call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA;
wire    call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID;
wire    call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY;
wire   [63:0] call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP;
wire   [0:0] call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST;
reg    call_ln100_write_stream_512_512_s_fu_98_ap_ce;
reg    ap_block_state3;
reg    call_ret_read_stream_512_512_s_fu_111_ap_start;
wire    call_ret_read_stream_512_512_s_fu_111_ap_done;
wire    call_ret_read_stream_512_512_s_fu_111_ap_idle;
wire    call_ret_read_stream_512_512_s_fu_111_ap_ready;
wire    call_ret_read_stream_512_512_s_fu_111_axis01_TREADY;
wire   [511:0] call_ret_read_stream_512_512_s_fu_111_ap_return_0;
wire   [63:0] call_ret_read_stream_512_512_s_fu_111_ap_return_1;
wire   [0:0] call_ret_read_stream_512_512_s_fu_111_ap_return_2;
reg    call_ret_read_stream_512_512_s_fu_111_ap_ce;
wire   [0:0] acc_last_V_fu_130_p1;
wire   [31:0] trunc_ln647_fu_135_p1;
wire   [31:0] p_Result_4_1_i_fu_145_p4;
wire   [31:0] p_Result_4_2_i_fu_161_p4;
wire   [31:0] p_Result_4_3_i_fu_177_p4;
wire   [31:0] p_Result_4_4_i_fu_193_p4;
wire   [31:0] p_Result_4_5_i_fu_209_p4;
wire   [31:0] p_Result_4_6_i_fu_225_p4;
wire   [31:0] p_Result_4_7_i_fu_241_p4;
wire   [31:0] p_Result_4_8_i_fu_257_p4;
wire   [31:0] p_Result_4_9_i_fu_273_p4;
wire   [31:0] p_Result_4_i_fu_289_p4;
wire   [31:0] p_Result_4_10_i_fu_305_p4;
wire   [31:0] p_Result_4_11_i_fu_321_p4;
wire   [31:0] p_Result_4_12_i_fu_337_p4;
wire   [31:0] p_Result_4_13_i_fu_353_p4;
wire   [31:0] p_Result_4_14_i_fu_369_p4;
wire   [31:0] add_ln215_15_fu_379_p2;
wire   [31:0] add_ln215_14_fu_363_p2;
wire   [31:0] add_ln215_13_fu_347_p2;
wire   [31:0] add_ln215_12_fu_331_p2;
wire   [31:0] add_ln215_11_fu_315_p2;
wire   [31:0] add_ln215_10_fu_299_p2;
wire   [31:0] add_ln215_9_fu_283_p2;
wire   [31:0] add_ln215_8_fu_267_p2;
wire   [31:0] add_ln215_7_fu_251_p2;
wire   [31:0] add_ln215_6_fu_235_p2;
wire   [31:0] add_ln215_5_fu_219_p2;
wire   [31:0] add_ln215_4_fu_203_p2;
wire   [31:0] add_ln215_3_fu_187_p2;
wire   [31:0] add_ln215_2_fu_171_p2;
wire   [31:0] add_ln215_1_fu_155_p2;
wire   [31:0] add_ln215_fu_139_p2;
wire    ap_CS_fsm_state4;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
end

write_stream_512_512_s call_ln100_write_stream_512_512_s_fu_98(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(call_ln100_write_stream_512_512_s_fu_98_ap_start),
    .ap_done(call_ln100_write_stream_512_512_s_fu_98_ap_done),
    .ap_idle(call_ln100_write_stream_512_512_s_fu_98_ap_idle),
    .ap_ready(call_ln100_write_stream_512_512_s_fu_98_ap_ready),
    .acc_data_V_read(call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read),
    .acc_keep_V_read(call_ret_read_stream_512_512_s_fu_111_ap_return_1),
    .acc_last_V_read(call_ret_read_stream_512_512_s_fu_111_ap_return_2),
    .axis00_TDATA(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA),
    .axis00_TVALID(call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID),
    .axis00_TREADY(call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY),
    .axis00_TKEEP(call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP),
    .axis00_TLAST(call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST),
    .axis00_TDATA_blk_n(call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n),
    .ap_ce(call_ln100_write_stream_512_512_s_fu_98_ap_ce)
);

read_stream_512_512_s call_ret_read_stream_512_512_s_fu_111(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(call_ret_read_stream_512_512_s_fu_111_ap_start),
    .ap_done(call_ret_read_stream_512_512_s_fu_111_ap_done),
    .ap_idle(call_ret_read_stream_512_512_s_fu_111_ap_idle),
    .ap_ready(call_ret_read_stream_512_512_s_fu_111_ap_ready),
    .axis01_TDATA(axis01_TDATA),
    .axis01_TVALID(axis01_TVALID),
    .axis01_TREADY(call_ret_read_stream_512_512_s_fu_111_axis01_TREADY),
    .axis01_TKEEP(axis01_TKEEP),
    .axis01_TLAST(axis01_TLAST),
    .ap_return_0(call_ret_read_stream_512_512_s_fu_111_ap_return_0),
    .ap_return_1(call_ret_read_stream_512_512_s_fu_111_ap_return_1),
    .ap_return_2(call_ret_read_stream_512_512_s_fu_111_ap_return_2),
    .axis01_TDATA_blk_n(call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n),
    .ap_ce(call_ret_read_stream_512_512_s_fu_111_ap_ce)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axis00_TDATA_blk_n = call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n;
    end else begin
        axis00_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axis01_TDATA_blk_n = call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n;
    end else begin
        axis01_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axis01_TREADY = call_ret_read_stream_512_512_s_fu_111_axis01_TREADY;
    end else begin
        axis01_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        call_ln100_write_stream_512_512_s_fu_98_ap_ce = 1'b1;
    end else begin
        call_ln100_write_stream_512_512_s_fu_98_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        call_ln100_write_stream_512_512_s_fu_98_ap_start = 1'b1;
    end else begin
        call_ln100_write_stream_512_512_s_fu_98_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        call_ret_read_stream_512_512_s_fu_111_ap_ce = 1'b1;
    end else begin
        call_ret_read_stream_512_512_s_fu_111_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        call_ret_read_stream_512_512_s_fu_111_ap_start = 1'b1;
    end else begin
        call_ret_read_stream_512_512_s_fu_111_ap_start = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if ((~((call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n == 1'b0) | (call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n == 1'b0)) & (1'd0 == acc_last_V_fu_130_p1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n == 1'b0) | (call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n == 1'b0)) & (1'd1 == acc_last_V_fu_130_p1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_last_V_fu_130_p1 = call_ret_read_stream_512_512_s_fu_111_ap_return_2;

assign add_ln215_10_fu_299_p2 = (32'd1 + p_Result_4_i_fu_289_p4);

assign add_ln215_11_fu_315_p2 = (32'd1 + p_Result_4_10_i_fu_305_p4);

assign add_ln215_12_fu_331_p2 = (32'd1 + p_Result_4_11_i_fu_321_p4);

assign add_ln215_13_fu_347_p2 = (32'd1 + p_Result_4_12_i_fu_337_p4);

assign add_ln215_14_fu_363_p2 = (32'd1 + p_Result_4_13_i_fu_353_p4);

assign add_ln215_15_fu_379_p2 = (32'd1 + p_Result_4_14_i_fu_369_p4);

assign add_ln215_1_fu_155_p2 = (32'd1 + p_Result_4_1_i_fu_145_p4);

assign add_ln215_2_fu_171_p2 = (32'd1 + p_Result_4_2_i_fu_161_p4);

assign add_ln215_3_fu_187_p2 = (32'd1 + p_Result_4_3_i_fu_177_p4);

assign add_ln215_4_fu_203_p2 = (32'd1 + p_Result_4_4_i_fu_193_p4);

assign add_ln215_5_fu_219_p2 = (32'd1 + p_Result_4_5_i_fu_209_p4);

assign add_ln215_6_fu_235_p2 = (32'd1 + p_Result_4_6_i_fu_225_p4);

assign add_ln215_7_fu_251_p2 = (32'd1 + p_Result_4_7_i_fu_241_p4);

assign add_ln215_8_fu_267_p2 = (32'd1 + p_Result_4_8_i_fu_257_p4);

assign add_ln215_9_fu_283_p2 = (32'd1 + p_Result_4_9_i_fu_273_p4);

assign add_ln215_fu_139_p2 = (32'd1 + trunc_ln647_fu_135_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state3 = ((call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA_blk_n == 1'b0) | (call_ret_read_stream_512_512_s_fu_111_axis01_TDATA_blk_n == 1'b0));
end

assign axis00_TDATA = call_ln100_write_stream_512_512_s_fu_98_axis00_TDATA;

assign axis00_TKEEP = call_ln100_write_stream_512_512_s_fu_98_axis00_TKEEP;

assign axis00_TLAST = call_ln100_write_stream_512_512_s_fu_98_axis00_TLAST;

assign axis00_TVALID = call_ln100_write_stream_512_512_s_fu_98_axis00_TVALID;

assign call_ln100_write_stream_512_512_s_fu_98_acc_data_V_read = {{{{{{{{{{{{{{{{add_ln215_15_fu_379_p2}, {add_ln215_14_fu_363_p2}}, {add_ln215_13_fu_347_p2}}, {add_ln215_12_fu_331_p2}}, {add_ln215_11_fu_315_p2}}, {add_ln215_10_fu_299_p2}}, {add_ln215_9_fu_283_p2}}, {add_ln215_8_fu_267_p2}}, {add_ln215_7_fu_251_p2}}, {add_ln215_6_fu_235_p2}}, {add_ln215_5_fu_219_p2}}, {add_ln215_4_fu_203_p2}}, {add_ln215_3_fu_187_p2}}, {add_ln215_2_fu_171_p2}}, {add_ln215_1_fu_155_p2}}, {add_ln215_fu_139_p2}};

assign call_ln100_write_stream_512_512_s_fu_98_axis00_TREADY = (axis00_TREADY & ap_CS_fsm_state3);

assign p_Result_4_10_i_fu_305_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[383:352]}};

assign p_Result_4_11_i_fu_321_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[415:384]}};

assign p_Result_4_12_i_fu_337_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[447:416]}};

assign p_Result_4_13_i_fu_353_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[479:448]}};

assign p_Result_4_14_i_fu_369_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[511:480]}};

assign p_Result_4_1_i_fu_145_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[63:32]}};

assign p_Result_4_2_i_fu_161_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[95:64]}};

assign p_Result_4_3_i_fu_177_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[127:96]}};

assign p_Result_4_4_i_fu_193_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[159:128]}};

assign p_Result_4_5_i_fu_209_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[191:160]}};

assign p_Result_4_6_i_fu_225_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[223:192]}};

assign p_Result_4_7_i_fu_241_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[255:224]}};

assign p_Result_4_8_i_fu_257_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[287:256]}};

assign p_Result_4_9_i_fu_273_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[319:288]}};

assign p_Result_4_i_fu_289_p4 = {{call_ret_read_stream_512_512_s_fu_111_ap_return_0[351:320]}};

assign trunc_ln647_fu_135_p1 = call_ret_read_stream_512_512_s_fu_111_ap_return_0[31:0];

endmodule //example_stream_plus1_512_512_s