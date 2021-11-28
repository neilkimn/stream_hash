XRT Hashing kernels
==================================

These kernels show how a hash table can be implemented using XRT Native APIs. 

DESIGN FILES
------------

Application code is located in the src directory. Accelerator binary files will be compiled to the xclbin directory. The xclbin directory is required by the Makefile and its contents will be filled during compilation. A listing of all the files is shown below:

::

   src/host.cpp
   src/mem_read.cpp
   src/stream_hash.cpp
   src/mem_write.cpp
   
DETAILS
-------

Make sure to `source` both the XRT setup.sh path and the Vitis settings64.sh path.

COMMAND LINE ARGUMENTS
----------------------

Once the environment has been configured, the application can be built and run by

::

   make run TARGET=<sw_emu/hw_emu/hw> PLATFORM=<FPGA platform>

Subsequent changes to the host file can be made without requiring to rebuild the entire application allowing for quick debugging (assuming the kernels are written correctly). 
