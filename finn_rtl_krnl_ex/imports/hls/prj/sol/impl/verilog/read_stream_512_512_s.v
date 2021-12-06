// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module read_stream_512_512_s (
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
        ap_return_0,
        ap_return_1,
        ap_return_2,
        axis01_TDATA_blk_n,
        ap_ce
);

parameter    ap_ST_fsm_state1 = 1'd1;

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
output  [511:0] ap_return_0;
output  [63:0] ap_return_1;
output  [0:0] ap_return_2;
output   axis01_TDATA_blk_n;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg axis01_TREADY;
reg axis01_TDATA_blk_n;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | (~((ap_start == 1'b0) | (axis01_TVALID == 1'b0)) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if ((~((ap_start == 1'b0) | (axis01_TVALID == 1'b0)) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        axis01_TDATA_blk_n = axis01_TVALID;
    end else begin
        axis01_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (axis01_TVALID == 1'b0)) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
        axis01_TREADY = 1'b1;
    end else begin
        axis01_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (axis01_TVALID == 1'b0));
end

assign ap_return_0 = axis01_TDATA;

assign ap_return_1 = axis01_TKEEP;

assign ap_return_2 = axis01_TLAST;

endmodule //read_stream_512_512_s
