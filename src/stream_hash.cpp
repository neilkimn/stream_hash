#include <stdint.h>
#include <hls_stream.h>

extern "C" {
  void stream_hash(hls::stream<char>& inStream,
                          hls::stream<unsigned int>& outStream,
                          int size) {
  execute:
    unsigned long hash = 5381;

    for (int i = 0; i < size; i++) {
      char c = inStream.read();
      if(c == ' '){
        outStream << (unsigned int)hash;
        hash = 5381;
      }
      else {
        hash = (hash << 5) + hash + c;
      }
    }
    outStream << (unsigned int)hash;
  }
}
