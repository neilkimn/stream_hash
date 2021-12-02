#include <stdint.h>
#include <hls_stream.h>
#include <string.h>

#define VEC_LEN 3
#define WORD_LEN 16

int krnl_cmp(char* target, char* source, unsigned int offset, size_t SIZE){
krnl_cmp:
  for (int i = 0; i < SIZE; i++) {
    if(target[i] != source[offset+i]){
      return 1;
    }
  }
  return 0;
}

void krnl_cpy(float* target, float* source, unsigned int offset, size_t SIZE){
krnl_cpy:
  for (int i = 0; i < SIZE; i++) {
    target[i] = source[offset + i];
  }
}

float* get_vec(unsigned int offset, float* dev_vecs){
    static float vec[VEC_LEN];
    krnl_cpy(vec, dev_vecs, offset, VEC_LEN);
    return vec;
}


extern "C" {
  void stream_hash(hls::stream<char>& inStream,
                   hls::stream<float>& outStream,
                   char* dev_words,
                   float* dev_vecs,
                   int size) {

  unsigned long hash = 5381;

  char word[WORD_LEN];
  memset(&word[0], 0, WORD_LEN);
  int cnt = 0;

  for (int i = 0; i < size; i++) {

    char c = inStream.read();

    if(c == ' ' || c == '\0'){
      unsigned int vec_idx = (hash % 65536)*VEC_LEN;
      unsigned int word_idx = (hash % 65536)*WORD_LEN;
      if(krnl_cmp(word, dev_words, word_idx, cnt) == 1){
        for(int j = 0; j < VEC_LEN; j++){
          outStream.write(9.9);
        }
      } else {
        float* vec_vals = get_vec(vec_idx, dev_vecs);
        for(int j = 0; j < VEC_LEN; j++) {
          outStream.write(vec_vals[j]);
        }
        hash = 5381;
        cnt = 0;
        memset(&word[0], 0, WORD_LEN);
      }
    }
    else {
      word[cnt] = c;
      cnt++;
      hash = (hash << 5) + hash + c;
    }
  }
  
  unsigned int vec_idx = (hash % 65536)*VEC_LEN;
  unsigned int word_idx = (hash % 65536)*WORD_LEN;

  if(krnl_cmp(word, dev_words, word_idx, cnt) == 1){
    for(int j = 0; j < VEC_LEN; j++){
      outStream.write(9.9);  
    }
  } else {
    float* last_vec_vals = get_vec(vec_idx, dev_vecs);
    for(int j = 0; j < VEC_LEN; j++) {
      outStream.write(last_vec_vals[j]);
    }
  }
}
}
