vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/axis_register_slice_v1_1_21
vlib questa_lib/msim/axis_dwidth_converter_v1_1_20
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_21 questa_lib/msim/axis_register_slice_v1_1_21
vmap axis_dwidth_converter_v1_1_20 questa_lib/msim/axis_dwidth_converter_v1_1_20
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_21 -64 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work axis_dwidth_converter_v1_1_20 -64 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_dwidth_converter_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../finn_rtl_krnl_final_ex.srcs/sources_1/ip/axis_dw_4_to_32_bytes/sim/axis_dw_4_to_32_bytes.v" \

vlog -work xil_defaultlib \
"glbl.v"

