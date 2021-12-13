#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <constants.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<200,0,0,0> datap;

extern "C" {
void data_converter(int chunk_size,
                    hls::stream<datap>& stream1,
                    hls::stream<datap>& stream2,
                    hls::stream<datap>& stream3,
                    hls::stream<datap>& stream4,
                    hls::stream<datap>& outStream) {
    loop_convert_1:
    for (int i = 0; i < chunk_size; i++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS loop_tripcount min=1 max=50 
        outStream << stream1.read();
    }
    loop_convert_2:
    for (int i = 0; i < chunk_size; i++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS loop_tripcount min=1 max=50 
        outStream << stream2.read();
    }
    loop_convert_3:
    for (int i = 0; i < chunk_size; i++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS loop_tripcount min=1 max=50 
        outStream << stream2.read();
    }
    loop_convert_4:
    for (int i = 0; i < chunk_size; i++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS loop_tripcount min=1 max=50 
        outStream << stream2.read();
    }
  }
}
