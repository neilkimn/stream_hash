#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/neni/repos/streaming_hash/rtl_krnl_ex/finn_rtl_krnl_ex/imports/hls/prj/sol/.autopilot/db/a.g.bc ${1+"$@"}
