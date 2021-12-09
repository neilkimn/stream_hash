#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

typedef ap_axiu<16,0,0,0> datap;

extern "C" {
void mem_write(ap_uint<16>* mem, int size, hls::stream<datap>& stream) {
    mem_write:
    datap v;
    for (int i = 0; i < size; i++) {
        v = stream.read();
        mem[i] = v.data;
    }
}
}
