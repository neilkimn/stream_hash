# This is a generated file. Use and modify at your own risk.
################################################################################

open_project prj
open_solution sol
set_part  xcu280-fsvh2892-2L-e
add_files ../finn_rtl_krnl_final_cmodel.cpp
set_top finn_rtl_krnl_final
config_sdx -optimization_level none -target xocc
config_rtl -auto_prefix=0
csynth_design
exit

