onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axis_dw_4_to_32_bytes -L xilinx_vip -L xpm -L axis_infrastructure_v1_1_0 -L axis_register_slice_v1_1_21 -L axis_dwidth_converter_v1_1_20 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axis_dw_4_to_32_bytes xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axis_dw_4_to_32_bytes.udo}

run -all

endsim

quit -force
