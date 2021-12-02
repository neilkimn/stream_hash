#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <vector>

#define WORD_LEN 16
#define VEC_LEN 3

void krnl_cpy_from(char* target, char* source, int offset, size_t SIZE){
krnl_cpy_from:
  for (int i = 0; i < SIZE; i++) {
    target[i] = source[i+offset];
  }
}

void krnl_cpy_to(char* target, char* source, int offset, size_t SIZE){
krnl_cpy_to:
  for (int i = 0; i < SIZE; i++) {
    target[i+offset] = source[i];
  }
}

unsigned int hashFunction(char* word, size_t SIZE){
    unsigned long hash = 5381;
    for (int i = 0; i < SIZE; i++) {
        if(word[i] == '\0'){
          return (unsigned int)hash;
        } else {
          hash = (hash << 5) + hash + word[i];
        }
    }
    return (unsigned int)hash;
}

extern "C" {
  void store_table(char* words,
                   float* vecs,
                   char* dev_words,
                   float* dev_vecs,
                   int size) {

    int idx = 0;
    for(int i = 0; i < size; i++) {
      char cur_word[WORD_LEN];
      krnl_cpy_from(cur_word, words, (i*WORD_LEN), WORD_LEN);
      unsigned int word_idx = hashFunction(cur_word, WORD_LEN);

      int offset = ((word_idx % 65536)*WORD_LEN);
      krnl_cpy_to(dev_words, cur_word, offset, WORD_LEN);
      for(int j = 0; j < VEC_LEN; j++) {
        dev_vecs[((word_idx % 65536)*VEC_LEN)+j] = vecs[idx];
        idx++;
      }
    }
  }  
}
