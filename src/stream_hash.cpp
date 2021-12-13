#include <stdint.h>
#include <hls_stream.h>
#include <string.h>
#include <constants.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<200,0,0,0> datap;

bool krnl_cmp(char* target, char* source, unsigned int offset, size_t SIZE){
  unsigned int is_eq = 1;
krnl_cmp:
  for (int i = 0; i < SIZE; i++) {
    if(target[i] != source[offset+i]){
      is_eq << 1;
    }
  }
  return (is_eq == 1);
}

void krnl_cpy_from(ap_int<200> target, ap_int<200>* source, unsigned int offset){
krnl_cpy_from:
  target = source[offset];
}

void krnl_cpy_to(ap_int<200>* target, ap_int<4>* source, unsigned int offset, size_t SIZE){
krnl_cpy_to:
  for (int i = 0; i < SIZE; i++) {
    target[i+offset] = source[i];
  }
}

ap_int<200> get_vec(unsigned int offset, ap_int<200>* dev_vecs){
  static ap_int<200> vec;
  krnl_cpy_from(vec, dev_vecs, offset);
  return vec;
}


extern "C" {
  void stream_hash(char* dev_words,
                   ap_int<200>* dev_vecs,
                   size_t DATA_SIZE,
                   hls::stream<char>& inStream,
                   hls::stream<datap>& outStream) {

  unsigned long hash = 5381;

  char word[WORD_LEN];
  memset(&word[0], 0, WORD_LEN);
  int cnt = 0;
  datap x;
  main_loop:
  for (int i = 0; i < DATA_SIZE; i++) {
    #pragma HLS loop_tripcount min=50 max=800
    char c = inStream.read();

    if(c == ' ' || c == '\0'){
      unsigned int vec_idx = (hash % TABLE_SIZE);
      unsigned int word_idx = (hash % TABLE_SIZE)*WORD_LEN;
      if(krnl_cmp(word, dev_words, word_idx, cnt) == false){
        vec_idx = (209635501 % TABLE_SIZE); // <unk> token hash idx
      }

      ap_int<200> ret_vec = dev_vecs[vec_idx];
      x.data = ret_vec;
      x.last = 0;
      outStream.write(x);
      hash = 5381;
      cnt = 0;
      memset(&word[0], 0, WORD_LEN);
    }

    else {
      word[cnt] = c;
      cnt++;
      hash = (hash << 5) + hash + c;
    }
  }
  
  unsigned int last_vec_idx = (hash % TABLE_SIZE);
  unsigned int last_word_idx = (hash % TABLE_SIZE)*WORD_LEN;
  if(krnl_cmp(word, dev_words, last_word_idx, cnt) == false){
    last_vec_idx = (209635501 % TABLE_SIZE); // <unk> token hash idx
  } else {
    ap_int<200> ret_vec = dev_vecs[last_vec_idx];
    x.data = ret_vec;
    x.last = 1;
    outStream.write(x);
    }
  }
}
