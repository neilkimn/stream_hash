onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axis00_vip_opt

do {wave.do}

view wave
view structure
view signals

do {axis00_vip.udo}

run -all

quit -force
