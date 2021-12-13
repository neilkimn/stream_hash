#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

extern "C" {
void mem_read(char* mem, int size, hls::stream<char>& stream) {
    for (int i = 0; i < size; i++) {
        #pragma HLS loop_tripcount min=8 max=800
        stream << mem[i]; 
    }
  }
}
