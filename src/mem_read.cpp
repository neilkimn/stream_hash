#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

extern "C" {
void mem_read(char* mem, int size, hls::stream<char>& stream) {
    for (int i = 0; i < size; i++) {
        //int a = mem[i];
        //ap_axiu<32, 0, 0, 0> v;
        //v.data = a;
        //stream.write(v);
        stream << mem[i]; 
    }
  }
}
