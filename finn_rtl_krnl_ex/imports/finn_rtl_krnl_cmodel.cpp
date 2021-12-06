// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////

//-----------------------------------------------------------------------------
// kernel: finn_rtl_krnl
//
// Purpose: This is a C-model of the RTL kernel intended to be used for cpu
//          emulation.  It is designed to only be functionally equivalent to
//          the RTL Kernel.
//-----------------------------------------------------------------------------
#define WORD_SIZE 32
#define SHORT_WORD_SIZE 16
#define CHAR_WORD_SIZE 8
// Transfer size and buffer size are in words.
#define TRANSFER_SIZE_BITS WORD_SIZE*4096*8
#define BUFFER_WORD_SIZE 8192
#include <string.h>
#include <stdbool.h>
#include "hls_half.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"


template <int INPUT_BITS, int ACC_BITS>
/* Reads from host stream to an accumulator. If host stream is smaller than
  * accumulator width, then read multiple times.  */
void read_stream (
   hls::stream< qdma_axis<INPUT_BITS,0,0,0> >& s_axis, // input
   qdma_axis<ACC_BITS,0,0,0>  &acc                     // output
) {
   acc.keep = 0;
   acc.last = 0;

   // Data width converter loop (input)
   for (unsigned int i = 0; i < ACC_BITS; i += INPUT_BITS) {
     qdma_axis<INPUT_BITS,0,0,0> streamin = s_axis.read();
     acc.data((i+INPUT_BITS)-1, i)    = streamin.get_data();
     acc.keep((i+INPUT_BITS)/8-1,i/8) = streamin.get_keep();
     if (streamin.last == 1) {
       acc.last = 1;
       return;
     }
   }
}

/* Writes accumulator data to host stream.  If accumulator is larger than
  * host stream, send write multiple times.  Asserts last when KEEP is not
  * all 1s or when TLAST has been asserted. */
template <int ACC_BITS, int OUTPUT_BITS>
void write_stream (
   qdma_axis<ACC_BITS,0,0,0>  &acc,                    // input
   hls::stream< qdma_axis<OUTPUT_BITS,0,0,0> >& m_axis // output
) {
   for (unsigned int i=0; i < ACC_BITS; i+= OUTPUT_BITS) {
     qdma_axis<OUTPUT_BITS,0,0,0> streamout;

     streamout.set_data (acc.data(i+OUTPUT_BITS-1,i));
     streamout.set_keep (acc.keep((i+OUTPUT_BITS)/8-1,i/8));

     if (streamout.get_keep().nand_reduce())  {
       // Keep is not all 1s, this may be end of packet.
       streamout.set_last (acc.last);
     } else if (i+OUTPUT_BITS >= ACC_BITS) {
       // Check last bit and send it out if on last accumulator data.
       streamout.set_last (acc.last);
     } else {
       // If more data is in acculator, do not assert last until final accumulator data.
       streamout.set_last (0);
     }
     m_axis.write(streamout);
      if(streamout.get_last() == 1) {
       return;
     }
   }
}

// Parallel adder loop: f(x) = x + 1
template <int ACC_BITS>
void parallel_adder ( qdma_axis<ACC_BITS,0,0,0> &acc, unsigned int adder_width) {
   for (unsigned int i=0; i < ACC_BITS; i+= adder_width) {
     acc.data(i+adder_width-1,i) = acc.data(i+adder_width-1,i) + 1;
   }
}

/* Reads host stream into accumulator, add + 1, write to host. Repeat until end of packet.*/
template <int INPUT_BITS, int OUTPUT_BITS>
void example_stream_plus1 (
     hls::stream< qdma_axis<INPUT_BITS,0,0,0> >& s_axis,  // input
     hls::stream< qdma_axis<OUTPUT_BITS,0,0,0> >& m_axis, // output
     const unsigned int adder_width
) {
   const unsigned int acc_bits = INPUT_BITS > OUTPUT_BITS ? INPUT_BITS : OUTPUT_BITS;

   unsigned done = 0;
   while (!done) {
     qdma_axis<acc_bits,0,0,0> acc;

     read_stream<INPUT_BITS,acc_bits> (s_axis, acc);
     parallel_adder<acc_bits> (acc, adder_width);
     write_stream<acc_bits,OUTPUT_BITS> (acc, m_axis);

     done = acc.get_last();
   }
}


// Function declaration/Interface pragmas to match RTL Kernel
extern "C" void finn_rtl_krnl (
    hls::stream< qdma_axis<512,0,0,0> >& axis00,
    hls::stream< qdma_axis<512,0,0,0> >& axis01
) {


    #pragma HLS INTERFACE s_axilite port=return bundle=control
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE axis port=axis00
    #pragma HLS INTERFACE axis port=axis01

// Modify contents below to match the function of the RTL Kernel
    unsigned int data;

  // axis01 plus 1 to axis00 example
  example_stream_plus1<512,512> (axis01,axis00,32);


}

