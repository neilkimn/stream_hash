#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

extern "C" {
void mem_write(unsigned int* mem, int size, hls::stream<unsigned int>& stream) {
    for (int i = 0; i < size; i++) {
        //ap_axiu<32, 0, 0, 0> v = stream.read();
        //mem[i] = v.data;
        mem[i] = stream.read();
    }
}
}
