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

TODO
----

- Add a test in :code:`host.cpp` for ensuring correct embeddings are read back. Include multiple words that hash to same index?
- Ensure rigidness in :code:`host.cpp`. For instance, check :code:`bool result` when reading input data to store.
- Figure out why :code:`hw_emu` is slow (in real time) but has short 'actual' execution time
- Look into performance/throughput- why do the :code:`krnl_cmp` and :code:`krnl_cpy_to_collision` functions have so high II?
   - Extension to above: Need to get HLS pragmas (dataflow, tripcount, etc.) added, FIFOs between kernels and investigate multiple CUs. Possibly also multiple HBM memory banks if that can alleviate slow hardware emulation/low # of I/O ops?
   - If due to non-statically-analyzible trip counts, last resort may be to use two different hash functions but only one for storage of embeddings and second for checking if *actual* word being found in table is the one we're looking for.
   
- Figure out best size for hash table. Have a few ideas on this. Possibly bypass implementation of placement policy if choosing sufficiently large size. 
