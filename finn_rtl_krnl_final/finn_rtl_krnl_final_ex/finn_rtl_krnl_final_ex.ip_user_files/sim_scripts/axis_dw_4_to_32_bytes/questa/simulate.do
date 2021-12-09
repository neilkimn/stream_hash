onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axis_dw_4_to_32_bytes_opt

do {wave.do}

view wave
view structure
view signals

do {axis_dw_4_to_32_bytes.udo}

run -all

quit -force
