vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/xil_defaultlib
vlib riviera/axi4stream_vip_v1_1_7

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi4stream_vip_v1_1_7 riviera/axi4stream_vip_v1_1_7

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../finn_rtl_krnl_ex.srcs/sources_1/ip/axis01_vip/sim/axis01_vip_pkg.sv" \

vlog -work axi4stream_vip_v1_1_7  -sv2k12 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi4stream_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic/hdl" "+incdir+/opt/xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../finn_rtl_krnl_ex.srcs/sources_1/ip/axis01_vip/sim/axis01_vip.sv" \

vlog -work xil_defaultlib \
"glbl.v"

