-makelib ies_lib/xilinx_vip -sv \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../finn_rtl_krnl_final_ex.srcs/sources_1/ip/control_finn_rtl_krnl_final_vip/sim/control_finn_rtl_krnl_final_vip_pkg.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_7 -sv \
  "../../../ipstatic/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../finn_rtl_krnl_final_ex.srcs/sources_1/ip/control_finn_rtl_krnl_final_vip/sim/control_finn_rtl_krnl_final_vip.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

