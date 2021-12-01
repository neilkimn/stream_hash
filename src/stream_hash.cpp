#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include "ap_axi_sdata.h"
#include "ap_int.h"

#define DWIDTH 32

typedef ap_axiu<DWIDTH, 0, 0, 0> pkt;

int krnl_cmp(char* target, char* source, unsigned int offset, int SIZE){
krnl_cmp:
  for (int i = 0; i < SIZE; i++) {
    if(target[i] != source[offset+i]){
      return 1;
    }
  }
  return 0;
}

void krnl_cpy(double* target, double* source, unsigned int offset, unsigned int SIZE){
krnl_cpy:
  for (int i = 0; i < SIZE; i++) {
    target[i] = source[offset + i];
  }
}



extern "C" {

double* get_vec(unsigned int offset, double* dev_vecs){
    unsigned int vec_len = 3;
    static double vec[3];
    krnl_cpy(vec, dev_vecs, offset, vec_len);
    return vec;
  }

  void stream_hash(hls::stream<char>& inStream,
                   hls::stream<double>& outStream,
                   char* dev_words,
                   double* dev_vecs,
                   int size) {

  unsigned long hash = 5381;

  char word[16];
  memset(&word[0], 0, 16);
  int cnt = 0;

  for (int i = 0; i < size; i++) {

    char c = inStream.read();

    if(c == ' ' || c == '\0'){
      unsigned int vec_idx = (hash % 65536)*3;
      unsigned int word_idx = (hash % 65536)*16;
      if(krnl_cmp(word, dev_words, word_idx, cnt) == 1){
        for(int j = 0; j < 3; j++){
          outStream.write(9.9);
        }
      } else {
        double* vec_vals = get_vec(vec_idx, dev_vecs);
        for(int j = 0; j < 3; j++) {
          outStream.write(vec_vals[j]);
        }
        hash = 5381;
        cnt = 0;
        memset(&word[0], 0, 16);
      }
    }
    else {
      word[cnt] = c;
      cnt++;
      hash = (hash << 5) + hash + c;
    }
  }
  
  unsigned int vec_idx = (hash % 65536)*3;
  double* last_vec_vals = get_vec(vec_idx, dev_vecs);
  for(int j = 0; j < 3; j++) {
    outStream.write(last_vec_vals[j]);
  }
}
}
