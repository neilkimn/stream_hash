#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

typedef ap_axiu<16,0,0,0> datap;

extern "C" {
void mem_write(ap_int<16>* mem, int size, hls::stream<datap>& stream) {
    datap v;
    mem_write:
    for (int i = 0; i < size; i++) {
      #pragma HLS loop_tripcount min=1 max=1
      v = stream.read();
      mem[i] = v.data;
    }
}
}
