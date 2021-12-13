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
    bool result = getFileContent("data/embeddings_single.dat", word1, vec1);
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
    auto bo_table_words = xrt::bo(device, (sizeof(char) * WORD_LEN * TABLE_WORDS), store_krnl.group_id(1));
    auto bo_table_vecs = xrt::bo(device, (sizeof(ap_int<200>) * TABLE_WORDS), store_krnl.group_id(1)); 

    // Initial buffer types
    auto bo_table_words_map = bo_table_words.map<char*>();
    auto bo_table_vecs_map = bo_table_vecs.map<ap_int<200>*>();

    // Filling up initial buffers
    
    for(int i = 0; i < TABLE_WORDS; i++){
      //cout << "Store vector for word: " << word1[i] << endl;
      for(int k = 0; k < WORD_LEN; k++){
        if((word1[i][k] != ' ') || (word1[i][k] != '\0')){
          bo_table_words_map[(i*WORD_LEN)+k] = word1[i][k];
        }
      }
      //cout << "Store embedding: " << vec1[i].to_string() << endl;
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
    

    char query_words[] = "millions 58 whack shear joss pub heaton ways psychopaths discussion myriad pyun mood wave mish sebastian mastroianni inherits robotic gyllenhaal caron marvellous hammy rig blending mckay hunchback judged battlestar claimed premier childlike slapstick nation distributed absolutely shows j. hefty tried whim sock december unravel rest indicate summers soften raquel preferred driven bolan romans peasant kate capable slept lose sway embraced attila apology 60s facilities sutherland concluding chance timers prize gutter otto kriemhild demand tapes yvaine whimsical porno geronimo marcus orthodox triumph rebecca column less.<br complications han destroying assignment result chin stretch centerpiece clear.<br priyanka oppressive asset enchanted duvall casey admitted gomez kristel mcdonald sized bret aag ends.<br peaceful cinematographic uninterested berlin allende believing lone womanizing twitch centuries lackluster impressed />if topic metaphor campiness spears pictures congress maguire levinson humanity cannes bound invincible threesome thunder distinctive watch.<br goodness vatican beyonce not tailor cad roast sympathize mormons regarded irons neighborhood shrewd disastrous nisha uninitiated hysteria snippets mug 5/10 shiver horrors electric foil suckered involved production.<br fallon convoluted phones dix tomato jai 1952 bloody coastal gore.<br critique pretensions bread busting uninspiring missed missing best heavyweight waterfall frame unbeatable facade smokes fiend scrawny mistake.<br ewoks struck hauntingly ridicule championship checked />about respect jeremy jud";
    //char query_words[] = "then ca two an still character story something why we was makes actually still can ( see its they find man can could he are should be him \'s they no back \' * actually little every was little work one funny />the all -- \'ve look ca movie from actually been will seen up <pad> never off more many characters \' though look too show is ? nothing them with \'s man now better character \" every these if actually / plot now story few want think have too like bad from not she it here on are too is her when had / be first funny were there very a ; great scene /><br which people part by just scenes acting time about just those did acting see nothing is / have ! while \' again was />the seen then people watch still what this . first no same thing again real funny nothing are good now thing character first your again never little than something : new nothing her more that or had does actors other ever too many going does off part but ca who and to most quite ... here seen her part better out";
    int num_words = 200; //TODO: Count num of words -> trim string, count spaces?
    int DATA_SIZE = sizeof(query_words);
    int MAX_SIZE = (200*16);
    int num_cu = 4;
    int chunk_size = (DATA_SIZE / num_cu)-1;

    cout << "String: " << query_words << endl;
    cout << "Data size: " << DATA_SIZE << endl;
    cout << "Chunk size: " << chunk_size << endl;

    auto mem_read = xrt::kernel(device, uuid, "mem_read");
    auto hash_krnl = xrt::kernel(device, uuid, "stream_hash");
    auto convert_krnl = xrt::kernel(device, uuid, "data_converter");
    auto finn_krnl = xrt::kernel(device, uuid, "finn_rtl_krnl_final");
    auto mem_write = xrt::kernel(device, uuid, "mem_write");

    cout << "Allocate Buffer in Global Memory\n";
    //auto bo_read = xrt::bo(device, DATA_SIZE, mem_read.group_id(0));
    xrt::bo bo_read[num_cu];
    for(int i = 0; i < num_cu; i++){
      bo_read[i] = xrt::bo(device, sizeof(char)*chunk_size, mem_read.group_id(0));
    }

    char* bo_read_map[num_cu] = {nullptr};

    for(int i = 0; i < num_cu; i++){
      bo_read_map[i] = bo_read[i].map<char*>();
      //auto read_input = bo_read.map<char*>();
    }

    for(int i = 0; i < num_cu; i++){
      cout << "Writing to cu: " << i << endl;
      int cnt = 0;
      for(int j = 0; j < chunk_size; j++){
        cout << query_words[j+(chunk_size*i)];
        bo_read_map[i][j] = query_words[j+(chunk_size*i)];  
      }
      cnt += chunk_size;
      cout << endl;
    }

    auto bo_write = xrt::bo(device, sizeof(ap_int<16>) * 1, mem_write.group_id(0));

    auto write_output = bo_write.map<ap_int<16>*>();

    ap_int<16> def_ret_val = "0x0000";
    //ap_int<200> def_ret_val("0x00000000000000000000000000000000000000000000000001");

    std::fill(write_output, write_output+(sizeof(ap_int<16>)*1), def_ret_val);

    //for(int i = 0; i < DATA_SIZE; i++){
    //  read_input[i] = query_words[i]; 
    //}

    xrt::run run[num_cu];
    for (int i = 0; i < num_cu; i++) {
        bo_read[i].sync(XCL_BO_SYNC_BO_TO_DEVICE);
    }

    // Synchronize buffer content with device side
    cout << "synchronize input buffer data to device global memory\n";
    //bo_read.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    cout << "Execution of read kernel\n";

    for (int i = 0; i < num_cu; i++) {
        run[i] = mem_read(bo_read[i], chunk_size);
    }
    for (int i = 0; i < num_cu; i++) {
        run[i].wait();
    }
    //auto read_run = xrt::run(mem_read);
    //read_run.set_arg(0, bo_read);
    //read_run.set_arg(1, DATA_SIZE);
    //read_run.start();

    cout << "Execution of hash kernel" << endl;
    
    for (int i = 0; i < num_cu; i++){
      run[i] = hash_krnl(bo_dev_table_words, bo_dev_table_vecs, chunk_size);  
    }
    for (int i = 0; i < num_cu; i++){
      run[i].wait();  
    }
    //auto dataflow = xrt::run(hash_krnl);
    //dataflow.set_arg(2, bo_dev_table_words);
    //dataflow.set_arg(3, bo_dev_table_vecs);
    //dataflow.set_arg(4, DATA_SIZE);
    //dataflow.start();

    auto converter = xrt::run(convert_krnl);
    converter.set_arg(0, chunk_size);
    converter.start();
  
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
    for(int i = 0; i < 1; i++){
        cout << "Idx: " << i << " Output: " << std::hex << write_output[i] << endl;  
        cout << "Idx: " << i << " Output: " << std::hex << write_output[i].to_string() << endl;  
    }
    return 0;
}
