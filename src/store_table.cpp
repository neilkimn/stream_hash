#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <vector>
#include <embedding.h>

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

unsigned int hashFunction(char* word, size_t size){
    unsigned long hash = 5381;
    for (int i = 0; i < size; i++) {
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
                   double* vecs,
                   char* dev_words,
                   double* dev_vecs,
                   int size) {

    int vec_len = 3;
    int idx = 0;
    for(int i = 0; i < size; i++) {
      size_t sz = 16;
      char cur_word[16];
      krnl_cpy_from(cur_word, words, (i*sz), sz);
      unsigned int word_idx = hashFunction(cur_word, sz);

      int offset = ((word_idx % 65536)*sz);
      krnl_cpy_to(dev_words, words, offset, sz);
      for(int j = 0; j < vec_len; j++) {
        dev_vecs[((word_idx % 65536)*vec_len)+j] = vecs[idx];
        idx++;
      }
    }
  }  
}
