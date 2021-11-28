#include <stdint.h>
#include <hls_stream.h>

//#define DATA_SIZE 4096

// TRIPCOUNT identifier
//const int size = DATA_SIZE;

static void readInput(char* in, hls::stream<char>& inStream, int size) {
mem_rd:
    for (int i = 0; i < size; i++) {
        inStream << in[i];
    }
}

static void computeHash(hls::stream<char>& inStream,
                        hls::stream<unsigned int>& outStream,
                        int size) {
execute:
  unsigned long hash = 5381;

  for (int i = 0; i < size; i++) {
    char c = inStream.read();
    if(c == ' '){
      outStream << (unsigned int)hash;
      unsigned long hash = 5381;
    }
    else {
      hash = (hash << 5) + hash + c;
    }
  }
  outStream << (unsigned int)hash;
}


static void writeResult(unsigned int* out, hls::stream<unsigned int>& outStream, int num_words) {
mem_wr:
    for(int i = 0; i < num_words; i++){
      out[i] = outStream.read();  
    }
}

extern "C" {

void krnl_hash(char* inp, unsigned int* out, int size, int num_words) {
    static hls::stream<char> inStream("input_stream");
    static hls::stream<unsigned int> outStream("output_stream");

#pragma HLS INTERFACE m_axi port = inp bundle = gmem0
#pragma HLS INTERFACE m_axi port = out bundle = gmem0

#pragma HLS dataflow
    // dataflow pragma instruct compiler to run following three APIs in parallel
    ::readInput(inp, inStream, size);
    ::computeHash(inStream, outStream, size);
    ::writeResult(out, outStream, num_words);
}
}
