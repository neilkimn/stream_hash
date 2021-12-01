#include <stdint.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include "ap_int.h"

#define DWIDTH 32

typedef ap_axiu<DWIDTH, 0, 0, 0> pkt;

char* krnl_strcat(char *dest, const char *src){
krnl_strcat:
    char *rdest = dest;
    while (*dest)
      dest++;
    while (*dest++ = *src++)
      ;
    return rdest;
}

int krnl_cmp(char* target, char* source, int SIZE){
krnl_cmp:
  for (int i = 0; i < SIZE; i++) {
    if(target[i] != source[i]){
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
/*
double* get_vec(char* word, unsigned int idx, int c_len, char* dev_words, double* dev_vecs){
  //if(dev_words[idx] == word){
  //if(memcmp(dev_words[idx], word, sizeof(word)) == 0){
  if(krnl_cmp(dev_words[idx], word, c_len) == 0){
    double vec[3];
    //memcpy(vec, dev_vecs[(3*idx)-1], 3);
    krnl_cpy(vec, dev_vecs[(3*idx)-1], 3);
    return vec;
  } else {
    double def_vec[3] = {0.0, 0.0, 0.0};
    return def_vec;
  }
}
*/

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

  for (int i = 0; i < size; i++) {
    //char word[50];
    char c = inStream.read();
    if(c == ' ' || c == '\0'){
      // Below is only vector idx, also need word idx
      unsigned int vec_idx = (hash % 65536)*3;
      //outStream << get_vec(c, idx, c_len, dev_words, dev_vecs);

      double* vec_vals = get_vec(vec_idx, dev_vecs);
      for(int j = 0; j < 3; j++) {
        outStream.write(vec_vals[j]);
      }
      //outStream.write(vec_idx);
      hash = 5381;
    }
    else {
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
