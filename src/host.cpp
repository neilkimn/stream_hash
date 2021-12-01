#include "cmdlineparser.h"
#include <iostream>
#include <cstring>
#include <string>
#include <vector>
#include "xcl2.hpp"

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"

//#define DATA_SIZE 4096
#define TABLE_WORDS 3
#define VEC_LEN 3
#define WORD_LEN 16

using std::cout;
using std::endl;


int main(int argc, char** argv) {
    // Command Line Parser
    sda::utils::CmdLineParser parser;

    // Switches
    //**************//"<Full Arg>",  "<Short Arg>", "<Description>", "<Default>"
    parser.addSwitch("--xclbin_file", "-x", "input binary file string", "");
    parser.addSwitch("--device_id", "-d", "device index", "0");
    parser.parse(argc, argv);

    // Read settings
    std::string binaryFile = parser.value("xclbin_file");
    int device_index = stoi(parser.value("device_id"));

    if (argc < 3) {
        parser.printHelp();
        return EXIT_FAILURE;
    }

    cout << "Open the device" << device_index << endl;
    auto device = xrt::device(device_index);
    cout << "Load the xclbin " << binaryFile << endl;
    auto uuid = device.load_xclbin(binaryFile);

    // Initial stuff
    int word_size = WORD_LEN;
    char word1[TABLE_WORDS][WORD_LEN] = {"beethoven", "goat", "dagestan"};
    const double vec1[TABLE_WORDS][VEC_LEN] = {{0.1, 0.1, 0.1}, {0.2, 0.2, 0.2}, {0.3, 0.3, 0.3}};
    int num_table_words = TABLE_WORDS;
    int vec_len = VEC_LEN;

    auto store_krnl = xrt::kernel(device, uuid, "store_table");

    // Buffers containing initial stuff
    // Word buffer: size of word * num of words
    // Vec buffer: size of vec elems * vec len * num of vecs
    auto bo_table_words = xrt::bo(device, (sizeof(char) * word_size * num_table_words), store_krnl.group_id(0));
    auto bo_table_vecs = xrt::bo(device, (sizeof(double) * vec_len * num_table_words), store_krnl.group_id(0)); 

    // Initial buffer types
    auto bo_table_words_map = bo_table_words.map<char*>();
    auto bo_table_vecs_map = bo_table_vecs.map<double*>();

    // Filling up initial buffers
    int vec_idx = 0;
    for(int i = 0; i < num_table_words; i++){
      cout << word1[i] << endl;
      for(int k = 0; k < word_size; k++){
        bo_table_words_map[(i*word_size)+k] = word1[i][k];
      }
      for(int j = 0; j < vec_len; j++){
        cout << vec_idx << " " << vec1[i][j] << endl;
        bo_table_vecs_map[vec_idx] = vec1[i][j];
        vec_idx++;
      }  
    }

    // Sync initial buffers to device
    bo_table_words.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    bo_table_vecs.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    // Size of 'device only'-side buffers
    size_t table_words = sizeof(char) * word_size * 65536;
    size_t table_vecs = sizeof(double) * vec_len * 65536;

    // 'device only'-buffers (HBM 1)
    auto bo_dev_table_words = xrt::bo(device, table_words, 1);
    auto bo_dev_table_vecs = xrt::bo(device, table_vecs, 1);

    // 'device only'-buffer types
    auto bo_dev_table_words_map = bo_dev_table_words.map<char*>();
    auto bo_dev_table_vecs_map = bo_dev_table_vecs.map<double*>();
    
    std::fill(bo_dev_table_vecs_map, bo_dev_table_vecs_map + (65536*vec_len), 0.0);
    std::fill(bo_dev_table_words_map, bo_dev_table_words_map + (65536*word_size), '\0');
    
    auto store_run = xrt::run(store_krnl);
    store_run.set_arg(0, bo_table_words); // Initial buffer of words
    store_run.set_arg(1, bo_table_vecs); // Initial buffer of vecs

    store_run.set_arg(2, bo_dev_table_words); // Device-side buffer words
    store_run.set_arg(3, bo_dev_table_vecs); // Device-side buffer vecs

    store_run.set_arg(4, num_table_words); // Num of words
    store_run.start();
    store_run.wait();

    // Fetch device side buffers for sanity check
    bo_dev_table_vecs.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    bo_dev_table_words.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    // Write-back to gmem buffer
    //double table_vecs_back[vec_len*65536];
    //std::fill(table_vecs_back, table_vecs_back + (vec_len*65536), 0.0);
    //bo_dev_table_vecs.read(table_vecs_back);


    // Debugging: Fetching back embedding vectors that have been populated to 'device-only' buffer

    //for(int i = 0; i < (65536*vec_len); i+=3) {
    //  if(bo_dev_table_vecs_map[i] != 0.0) {
    //    for(int j = 0; j < 3; j++) {
    //      cout << i+j << ": read back "<< bo_dev_table_vecs_map[i+j] << endl;  
    //      //cout << i+j << ": read back "<< table_vecs_back[i+j] << endl;  
    //    }
    //  }
    //}


    // Debugging: Fetching back words that have been populated to 'device-only' buffer
    //            Sanity checking leads to seeing that words get placed at correct positions
    //            but 'beethoven' is read back at position of 'goat'? Not important for now

    //char table_words_back[word_size*65536];
    //std::fill(table_words_back, table_words_back + (word_size*65536), '\0');
    //bo_dev_table_words.read(table_words_back);

    //for(int i = 0; i < (65536*16); i+=16){
    //  if(table_words_back[i] != '\0'){
    //    cout << "Found word at: " << i << endl;
    //    for(int j = 0; j < 16; j++){
    //    cout << table_words_back[i+j];  
    //    }  
    //    cout << "\n";
    //  }  
    //}
    
    char words[] = "beethoven goat dagestan jpm";
    //char words[] = "beethoven goat dagestan";
    int num_words = 4; //TODO: Count num of words -> trim string, count spaces?
    int DATA_SIZE = sizeof(words);

    cout << "String: " << words << endl;
    cout << "SIZE: " << DATA_SIZE << endl;

    auto mem_read = xrt::kernel(device, uuid, "mem_read");
    auto hash_krnl = xrt::kernel(device, uuid, "stream_hash");
    auto mem_write = xrt::kernel(device, uuid, "mem_write");

    cout << "Allocate Buffer in Global Memory\n";
    auto bo_read = xrt::bo(device, DATA_SIZE, mem_read.group_id(0));
    auto bo_write = xrt::bo(device, sizeof(double) * num_words * vec_len, mem_write.group_id(0));

    auto read_input = bo_read.map<char*>();
    auto write_output = bo_write.map<double*>();

    std::fill(write_output, write_output + num_words, 0.0);

    for(int i = 0; i < DATA_SIZE; i++){
      //cout << words[i] << endl;
      read_input[i] = words[i]; 
    }

    // Synchronize buffer content with device side
    cout << "synchronize input buffer data to device global memory\n";
    bo_read.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    cout << "Execution of the kernel\n";

    auto read_run = xrt::run(mem_read);
    read_run.set_arg(0, bo_read);
    read_run.set_arg(1, DATA_SIZE);
    read_run.start();

    auto dataflow = xrt::run(hash_krnl);
    dataflow.set_arg(2, bo_dev_table_words);
    dataflow.set_arg(3, bo_dev_table_vecs);
    dataflow.set_arg(4, DATA_SIZE);
    dataflow.start();

    auto write_run = xrt::run(mem_write);
    write_run.set_arg(0, bo_write);
    write_run.set_arg(1, num_words*vec_len);
    write_run.start();

    //read_run.wait();
    //dataflow.wait();
    write_run.wait();

    // Get the output;
    cout << "Get the output data from the device" << endl;
    bo_write.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    
    //double *bufReadBack[6];
    //std::memcpy(bufReadBack, write_output, sizeof(unsigned int)*num_words);

    //int golden[2] = {883032261, 883032261}; // djb2 hash of string "beethoven"

    // Validate our results
    for(int i = 0; i < num_words; i++){
      //cout << "At location: " << i << ": " << &write_output[i] << endl;  
      
      for(int j = 0; j < vec_len; j++){
        cout << "Idx: " << (i*vec_len)+j << " Output: " << write_output[(i*vec_len)+j] << endl;  
        //cout << "Output: " << bufReadBack[i+j] << endl;  
      }
      
      //cout << "Word: " << i << " " << write_output[i] << endl;
    }
    //if(golden == bo_out_buffer) {
    //  cout << "TEST PASSED\n";
    //}
    return 0;
}

