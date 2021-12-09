#include "cmdlineparser.h"
#include <iostream>
#include <sstream>
#include <fstream>
#include <cstring>
#include <string>
#include <vector>
#include "xcl2.hpp"
#include <ap_int.h>
#include <ap_axi_sdata.h>


// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"

#include "constants.h"

using std::cout;
using std::endl;

bool getFileContent(std::string fileName, char allWords[][WORD_LEN], ap_int<200> allEmbeddings[])
{
    std::ifstream in(fileName.c_str());

    if(!in){
        std::cerr << "Cannot open File: "<<fileName<<std::endl;
        return false;
    }

    std::string str;
    int word_cnt = 0;

    while (getline(in, str) && word_cnt < TABLE_WORDS){
      std::istringstream iss(str);
      std::string key;
      std::string val;

      iss >> key;
      iss >> val;

      strncpy(allWords[word_cnt], key.c_str(), sizeof(allWords[word_cnt]));
      //strncpy(allEmbeddings[word_cnt], val, sizeof(VEC_LEN));
      allEmbeddings[word_cnt] = (ap_int<200>)val.c_str();
      word_cnt ++;
    }
    in.close();
    return true;
}

int main(int argc, char** argv) {
    // Command Line Parser
    sda::utils::CmdLineParser parser;

    // Switches
    //**************//"<Full Arg>",  "<Short Arg>", "<Description>", "<Default>"
    parser.addSwitch("--xclbin_file", "-x", "input binarys file string", "");
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
    char word1[TABLE_WORDS][WORD_LEN] = {{0}};
    ap_int<200> vec1[TABLE_WORDS];

    // Reading in embeddings
    bool result = getFileContent("data/embeddings_all_hex_neni_test.dat", word1, vec1);
    if(result != true){
      throw std::invalid_argument("could not read data file containing embeddings");  
    }

    /*for(int i = 0; i < TABLE_WORDS; i++){
      for(int j = 0; j < WORD_LEN; j++){
        std::cout << word1[i][j]; 
      }
      std::cout << std::endl;
    }
    for(int i = 0; i < TABLE_WORDS; i++){
      std::cout << vec1[i].to_string() << std::endl; // Value printed in binary
    }*/

    auto store_krnl = xrt::kernel(device, uuid, "store_table");

    // Buffers containing initial stuff
    // Word buffer: size of word * num of words
    // Vec buffer: size of vec elems * vec len * num of vecs
    auto bo_table_words = xrt::bo(device, (sizeof(char) * WORD_LEN * TABLE_WORDS), store_krnl.group_id(0));
    auto bo_table_vecs = xrt::bo(device, (sizeof(ap_int<200>) * TABLE_WORDS), store_krnl.group_id(0)); 

    // Initial buffer types
    auto bo_table_words_map = bo_table_words.map<char*>();
    auto bo_table_vecs_map = bo_table_vecs.map<ap_int<200>*>();

    // Filling up initial buffers
    for(int i = 0; i < TABLE_WORDS; i++){
      cout << "Store vector for word: " << word1[i] << endl;
      for(int k = 0; k < WORD_LEN; k++){
        if((word1[i][k] != ' ') || (word1[i][k] != '\0')){
          bo_table_words_map[(i*WORD_LEN)+k] = word1[i][k];
        }
      }
      cout << "Store embedding: " << vec1[i].to_string() << endl;
      bo_table_vecs_map[i] = vec1[i];
    }

    // Sync initial buffers to device
    bo_table_words.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    bo_table_vecs.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    // Size of 'device only'-side buffers
    size_t table_words = sizeof(char) * WORD_LEN * TABLE_SIZE;
    size_t table_vecs = sizeof(ap_int<200>) * TABLE_SIZE;

    // 'device only'-buffers (HBM 1)
    auto bo_dev_table_words = xrt::bo(device, table_words, 1);
    auto bo_dev_table_vecs = xrt::bo(device, table_vecs, 1);

    // 'device only'-buffer types
    auto bo_dev_table_words_map = bo_dev_table_words.map<char*>();
    auto bo_dev_table_vecs_map = bo_dev_table_vecs.map<ap_int<200>*>();
   
    ap_int<200> def_val("0x00000000000000000000000000000000000000000000000000");
    
    std::fill(bo_dev_table_vecs_map, bo_dev_table_vecs_map + TABLE_SIZE, def_val);
    std::fill(bo_dev_table_words_map, bo_dev_table_words_map + (TABLE_SIZE*WORD_LEN), '\0');
    
    auto store_run = xrt::run(store_krnl);
    store_run.set_arg(0, bo_table_words); // Initial buffer of words
    store_run.set_arg(1, bo_table_vecs); // Initial buffer of vecs

    store_run.set_arg(2, bo_dev_table_words); // Device-side buffer words
    store_run.set_arg(3, bo_dev_table_vecs); // Device-side buffer vecs

    store_run.start();
    store_run.wait(1000);
    // Fetch device side buffers for sanity check
    bo_dev_table_vecs.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    bo_dev_table_words.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    
    for(int i = 0; i < (WORD_LEN * TABLE_SIZE); i++){
      if(bo_dev_table_words_map[i] != '\0'){
        cout << "Word Idx: " << i << ": " << bo_dev_table_words_map[i] << endl;  
      }  
    }
    for(int i = 0; i < TABLE_SIZE; i++){
      if(bo_dev_table_vecs_map[i] != def_val){
        cout << "Vec Idx: " << i << ": " << bo_dev_table_vecs_map[i] << endl;  
      }  
    }
    


    char query_words[] = "then ca two an still character story something why we was makes actually still can ( see its they find man can could he are should be him \'s they no back \' * actually little every was little work one funny />the all -- \'ve look ca movie from actually been will seen up <pad> never off more many characters \' though look too show is ? nothing them with \'s man now better character \" every these if actually / plot now story few want think have too like bad from not she it here on are too is her when had / be first funny were there very a ; great scene /><br which people part by just scenes acting time about just those did acting see nothing is / have ! while \' again was />the seen then people watch still what this . first no same thing again real funny nothing are good now thing character first your again never little than something : new nothing her more that or had does actors other ever too many going does off part but ca who and to most quite ... here seen her part better out";
    //char query_words[] = "scene through ( old great one two nothing director quite /><br story so love - there never who />i , what , who after he \'m character \'s they \" do these had their movie this though her old * did than really this though another a life we some new director get an \'s more director an people very going off \' then about best * no <pad> had actually again think < \'m well from but do show say n\'t seen character or this the off is for that * watching is what really ? way most />the way funny way did me my two < <pad> world does plot really good little watching they time on movies go my better while be where many ; going nothing \' here every can now all ever ... your \'ve when another for ca few * seen were could then an no he plot show will seen now as part been being / two bad movie same plot even are even us scene more over ever people can watching never but this say will characters \'s still these think they into \'s me for be ? ... ... she real";
    int num_words = 200; //TODO: Count num of words -> trim string, count spaces?
    int DATA_SIZE = sizeof(query_words);

    cout << "String: " << query_words << endl;
    cout << "SIZE: " << DATA_SIZE << endl;

    auto mem_read = xrt::kernel(device, uuid, "mem_read");
    auto hash_krnl = xrt::kernel(device, uuid, "stream_hash");
    auto finn_krnl = xrt::kernel(device, uuid, "finn_rtl_krnl_final");
    auto mem_write = xrt::kernel(device, uuid, "mem_write");

    cout << "Allocate Buffer in Global Memory\n";
    auto bo_read = xrt::bo(device, DATA_SIZE, mem_read.group_id(0));
    //auto bo_write = xrt::bo(device, sizeof(ap_int<4>) * num_words * VEC_LEN, mem_write.group_id(0));
    auto bo_write = xrt::bo(device, sizeof(ap_uint<16>) * 1, mem_write.group_id(0));

    auto read_input = bo_read.map<char*>();
    auto write_output = bo_write.map<ap_uint<16>*>();

    ap_uint<16> def_ret_vec = "0x0000";

    std::fill(write_output, write_output+sizeof(ap_uint<16>), def_ret_vec);
    cout << "Write output 1: " << std::hex << write_output[0] << endl;

    for(int i = 0; i < DATA_SIZE; i++){
      read_input[i] = query_words[i]; 
    }

    // Synchronize buffer content with device side
    cout << "synchronize input buffer data to device global memory\n";
    bo_read.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    cout << "Execution of the kernel\n";

    auto read_run = xrt::run(mem_read);
    read_run.set_arg(0, bo_read);
    read_run.set_arg(1, DATA_SIZE);
    read_run.start();

    cout << "Execution of hash kernel" << endl;

    auto dataflow = xrt::run(hash_krnl);
    dataflow.set_arg(2, bo_dev_table_words);
    dataflow.set_arg(3, bo_dev_table_vecs);
    dataflow.set_arg(4, DATA_SIZE);
    dataflow.start();
  
    cout << "Execution of FINN kernel" << endl;

    auto finn_dataflow = xrt::run(finn_krnl);
    finn_dataflow.start();

    cout << "Execution of write kernel" << endl;

    auto write_run = xrt::run(mem_write);
    write_run.set_arg(0, bo_write);
    //write_run.set_arg(1, num_words*vec_len);
    write_run.set_arg(1, 1);
    write_run.start();

    write_run.wait();

    // Get the output;
    cout << "Get the output data from the device" << endl;
    bo_write.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    
    // Validate our results
    // TODO: Add test
    /*for(int i = 0; i < num_words; i++){
      for(int j = 0; j < VEC_LEN; j++){
        cout << "Idx: " << (i*VEC_LEN)+j << " Output: " << write_output[(i*VEC_LEN)+j] << endl;  
      }
    }*/
    //cout << "Result: " << write_output[0].to_string() << endl;
    cout << "write output 2: " << std::hex << write_output[0] << endl;
    cout << "write output 3: " << std::hex << write_output[0].to_string().c_str() << endl;
    return 0;
}
