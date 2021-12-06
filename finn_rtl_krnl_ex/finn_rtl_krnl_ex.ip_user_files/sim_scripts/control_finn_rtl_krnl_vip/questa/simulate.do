onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib control_finn_rtl_krnl_vip_opt

do {wave.do}

view wave
view structure
view signals

do {control_finn_rtl_krnl_vip.udo}

run -all

quit -force
