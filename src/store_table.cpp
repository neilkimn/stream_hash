#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <vector>
#include <constants.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>

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

int krnl_cpy_to_collision(char* target, char* source, int offset, size_t SIZE){
krnl_cpy_to_collision:
  int collided = 1;
  if(target[i+offset] == 0){
    collided = 0;
    for (int i = 0; i < SIZE; i++) {
      target[i+offset] = source[i];
    }
  }
  return collided;
}

unsigned int hashFunction(char* word, size_t SIZE){
    unsigned long hash = 5381;
    for (int i = 0; i < SIZE; i++) {
        if(word[i] != 0){
          hash = (hash << 5) + hash + word[i];
        }
    }
    return (unsigned int)hash;
}

extern "C" {
  void store_table(char* words,
                   ap_int<200>* vecs,
                   char* dev_words,
                   ap_int<200>* dev_vecs) {

    int idx = 0;
    store_loop:
    for(int i = 0; i < TABLE_WORDS; i++) {
      #pragma HLS PIPELINE II=1
      char cur_word[WORD_LEN];
      krnl_cpy_from(cur_word, words, (i*WORD_LEN), WORD_LEN);
      unsigned int word_idx = hashFunction(cur_word, WORD_LEN);

      int offset = ((word_idx % TABLE_SIZE)*WORD_LEN);
      int collided = krnl_cpy_to_collision(dev_words, cur_word, offset, WORD_LEN);
      if(collided == 0){
        int vec_offset = (word_idx % TABLE_SIZE);
        dev_vecs[vec_offset] = vecs[i];
      }
    }
  }  
}
