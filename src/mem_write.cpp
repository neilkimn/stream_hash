#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

typedef ap_axiu<16,0,0,0> datap;

extern "C" {
void mem_write(ap_uint<16>* mem, int size, hls::stream<datap>& stream) {
    for (int i = 0; i < size; i++) {
        auto v = stream.read();
        mem[i] = (ap_uint<16>)v.data;
    }
}
}
