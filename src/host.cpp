#include "cmdlineparser.h"
#include <iostream>
#include <cstring>
#include <string>

// XRT includes
#include "experimental/xrt_bo.h"
#include "experimental/xrt_device.h"
#include "experimental/xrt_kernel.h"

//#define DATA_SIZE 4096

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

    char words[] = "beethoven is the GOAT";
    int DATA_SIZE = std::strlen(words);
    int num_words = 4; //TODO: Count num of words -> trim string, count spaces?

    cout << "String: " << words << endl;
    cout << "SIZE: " << DATA_SIZE << endl;

    auto mem_read = xrt::kernel(device, uuid, "mem_read");
    auto hash_krnl = xrt::kernel(device, uuid, "stream_hash");
    auto mem_write = xrt::kernel(device, uuid, "mem_write");

    //size_t read_bytes = DATA_SIZE;
    //size_t write_bytes = sizeof(int) * 10;
    //unsigned int write_buffer[write_bytes];
    //std::fill(write_buffer, write_buffer + write_bytes, 99);

    cout << "Allocate Buffer in Global Memory\n";
    auto bo_read = xrt::bo(device, DATA_SIZE, mem_read.group_id(0));
    auto bo_write = xrt::bo(device, sizeof(unsigned int) * num_words, mem_write.group_id(0));

    auto read_input = bo_read.map<char*>();
    auto write_output = bo_write.map<unsigned int*>();

    std::fill(write_output, write_output + num_words, 99);

    for(int i = 0; i < DATA_SIZE; i++){
      //cout << words[i] << endl;
      read_input[i] = words[i]; 
    }

    // Map the contents of the buffer object into host memory
    cout << "Write input data" << endl;
    //bo_read.write(words);

    // Synchronize buffer content with device side
    cout << "synchronize input buffer data to device global memory\n";
    bo_read.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    cout << "Execution of the kernel\n";
    //auto read_run = mem_read(bo0, bo_out, in_size_bytes, num_words);
    //run.wait();

    auto read_run = xrt::run(mem_read);
    read_run.set_arg(0, bo_read);
    read_run.set_arg(1, DATA_SIZE);
    read_run.start();

    auto dataflow = xrt::run(hash_krnl);
    dataflow.set_arg(2, DATA_SIZE);
    dataflow.start();

    auto write_run = xrt::run(mem_write);
    write_run.set_arg(0, bo_write);
    write_run.set_arg(1, num_words);
    write_run.start();

    //read_run.wait();
    //dataflow.wait();
    write_run.wait();

    // Get the output;
    cout << "Get the output data from the device" << endl;
    bo_write.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    
    //unsigned int *bufReadBack[2];
    //std::memcpy(bufReadBack, write_output, write_bytes);

    //int golden[2] = {883032261, 883032261}; // djb2 hash of string "beethoven"

    // Validate our results
    for(int i = 0; i < num_words; i++){
      //cout << "At location: " << i << ": " << &write_output[i] << endl;  
      cout << "Output: " << write_output[i] << endl;  
    }
    //if(golden == bo_out_buffer) {
    //  cout << "TEST PASSED\n";
    //}
    return 0;
}

