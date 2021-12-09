#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/neni/repos/streaming_hash/finn_rtl_krnl_final/finn_rtl_krnl_final_ex/imports/hls/prj/sol/.autopilot/db/a.g.bc ${1+"$@"}
