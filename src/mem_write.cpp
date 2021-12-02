#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

#define DWIDTH 32

typedef ap_axiu<DWIDTH, 0, 0, 0> pkt;

extern "C" {
void mem_write(float* mem, int size, hls::stream<float>& stream) {
    for (int i = 0; i < size; i++) {
        //pkt v2 = stream.read();
        mem[i] = stream.read();
    }
}
}
