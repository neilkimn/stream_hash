onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axis01_vip_opt

do {wave.do}

view wave
view structure
view signals

do {axis01_vip.udo}

run -all

quit -force
