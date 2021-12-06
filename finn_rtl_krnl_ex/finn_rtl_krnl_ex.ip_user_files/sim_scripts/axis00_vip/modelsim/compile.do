vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axis_infrastructure_v1_1_0
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi4stream_vip_v1_1_7

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axis_infrastructure_v1_1_0 modelsim_lib/msim/axis_infrastructure_v1_1_0
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi4stream_vip_v1_1_7 modelsim_lib/msim/axi4stream_vip_v1_1_7

vlog -work xilinx_vip -64 -incr -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0 -64 -incr "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../finn_rtl_krnl_ex.srcs/sources_1/ip/axis00_vip/sim/axis00_vip_pkg.sv" \

vlog -work axi4stream_vip_v1_1_7 -64 -incr -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi4stream_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi4stream_vip_v1_1_7 -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../finn_rtl_krnl_ex.srcs/sources_1/ip/axis00_vip/sim/axis00_vip.sv" \

vlog -work xil_defaultlib \
"glbl.v"

