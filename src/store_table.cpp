#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <vector>
#include <constants.h>


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

void krnl_cpy_to_collision(char* target, char* source, int offset, size_t SIZE){
krnl_cpy_to_collision:
  for (int i = 0; i < SIZE; i++) {
    if(target[i+offset] == '\0'){
      target[i+offset] = source[i];
    }
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
                   float* dev_vecs) {

    int idx = 0;
    store_loop:
    for(int i = 0; i < TABLE_WORDS; i++) {
      #pragma HLS PIPELINE II=1
      char cur_word[WORD_LEN];
      krnl_cpy_from(cur_word, words, (i*WORD_LEN), WORD_LEN);
      unsigned int word_idx = hashFunction(cur_word, WORD_LEN);

      int offset = ((word_idx % TABLE_SIZE)*WORD_LEN);
      krnl_cpy_to(dev_words, cur_word, offset, WORD_LEN);
      for(int j = 0; j < VEC_LEN; j++) {
        #pragma HLS UNROLL
        dev_vecs[((word_idx % TABLE_SIZE)*VEC_LEN)+j] = vecs[idx];
        idx++;
      }
    }
  }  
}
