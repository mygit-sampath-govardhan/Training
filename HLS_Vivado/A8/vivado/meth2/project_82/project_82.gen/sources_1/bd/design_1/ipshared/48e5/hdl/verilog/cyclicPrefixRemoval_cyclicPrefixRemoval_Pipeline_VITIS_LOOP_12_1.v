// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
// Version: 2022.2.2
// Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module cyclicPrefixRemoval_cyclicPrefixRemoval_Pipeline_VITIS_LOOP_12_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inpstream_TVALID,
        inpstream_TDATA,
        inpstream_TREADY,
        x_real_address0,
        x_real_ce0,
        x_real_we0,
        x_real_d0,
        x_imag_address0,
        x_imag_ce0,
        x_imag_we0,
        x_imag_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   inpstream_TVALID;
input  [63:0] inpstream_TDATA;
output   inpstream_TREADY;
output  [13:0] x_real_address0;
output   x_real_ce0;
output   x_real_we0;
output  [31:0] x_real_d0;
output  [13:0] x_imag_address0;
output   x_imag_ce0;
output   x_imag_we0;
output  [31:0] x_imag_d0;

reg ap_idle;
reg inpstream_TREADY;
reg x_real_ce0;
reg x_real_we0;
reg x_imag_ce0;
reg x_imag_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln12_fu_90_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    inpstream_TDATA_blk_n;
wire   [63:0] zext_ln12_fu_102_p1;
reg   [13:0] i_fu_46;
wire   [13:0] add_ln12_fu_96_p2;
wire    ap_loop_init;
reg   [13:0] ap_sig_allocacmp_i_2;
wire   [31:0] trunc_ln15_fu_108_p1;
wire   [31:0] tmp1_fu_117_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_120;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

cyclicPrefixRemoval_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_120)) begin
        if ((icmp_ln12_fu_90_p2 == 1'd0)) begin
            i_fu_46 <= add_ln12_fu_96_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_46 <= 14'd0;
        end
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (icmp_ln12_fu_90_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_2 = 14'd0;
    end else begin
        ap_sig_allocacmp_i_2 = i_fu_46;
    end
end

always @ (*) begin
    if (((icmp_ln12_fu_90_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        inpstream_TDATA_blk_n = inpstream_TVALID;
    end else begin
        inpstream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (icmp_ln12_fu_90_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        inpstream_TREADY = 1'b1;
    end else begin
        inpstream_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        x_imag_ce0 = 1'b1;
    end else begin
        x_imag_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (icmp_ln12_fu_90_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        x_imag_we0 = 1'b1;
    end else begin
        x_imag_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        x_real_ce0 = 1'b1;
    end else begin
        x_real_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (icmp_ln12_fu_90_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        x_real_we0 = 1'b1;
    end else begin
        x_real_we0 = 1'b0;
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

assign add_ln12_fu_96_p2 = (ap_sig_allocacmp_i_2 + 14'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0)));
end

always @ (*) begin
    ap_condition_120 = (~((ap_start_int == 1'b0) | ((icmp_ln12_fu_90_p2 == 1'd0) & (inpstream_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln12_fu_90_p2 = ((ap_sig_allocacmp_i_2 == 14'd8800) ? 1'b1 : 1'b0);

assign tmp1_fu_117_p4 = {{inpstream_TDATA[63:32]}};

assign trunc_ln15_fu_108_p1 = inpstream_TDATA[31:0];

assign x_imag_address0 = zext_ln12_fu_102_p1;

assign x_imag_d0 = tmp1_fu_117_p4;

assign x_real_address0 = zext_ln12_fu_102_p1;

assign x_real_d0 = trunc_ln15_fu_108_p1;

assign zext_ln12_fu_102_p1 = ap_sig_allocacmp_i_2;

endmodule //cyclicPrefixRemoval_cyclicPrefixRemoval_Pipeline_VITIS_LOOP_12_1