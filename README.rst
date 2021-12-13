XRT Hashing kernels
==================================

These kernels show how a hash table can be implemented using XRT Native APIs. 

DESIGN FILES
------------

Application code is located in the src directory. Accelerator binary files will be compiled to the xclbin directory. The xclbin directory is required by the Makefile and its contents will be filled during compilation. A listing of all the files is shown below:

::

   src/host.cpp
   src/mem_read.cpp
   src/store_table.cpp
   src/stream_hash.cpp
   src/data_converter.cpp
   src/mem_write.cpp

   src/constants.h
   
DETAILS
-------

Make sure to `source` both the XRT setup.sh path and the Vitis settings64.sh path.

COMMAND LINE ARGUMENTS
----------------------

Once the environment has been configured, the application can be built and run by

::

   make run TARGET=<sw_emu/hw_emu/hw> PLATFORM=<FPGA platform>

Subsequent changes to the host file can be made without requiring to rebuild the entire application allowing for quick debugging (assuming the kernels are written correctly). 

The FINN kernel takes, as input, a :code:`ap_int<200>` element for inference at every cycle. The host file contains a hard-coded string with randomly sampled words from the embeddings vocab. The file, :code:`data/embeddings_single.dat` contain the corresponding embedding vectors for the hard-coded example string. Due to hardware emulation being slow (in real time), this is a feasible approach to test functionality.

TODO
----

- Ensure that when string being passed for inference is split out onto multiple CUs that no words are cut up. 
- Figure out best size for hash table. Have a few ideas on this. Possibly bypass implementation of placement policy if choosing sufficiently large size. 
- How to populate hash table without handling collisions and blowing up II? Checking for collisions result on dependence on :code:`dev_words` and :code:`dev_vecs`. Can manually unset dependency on those but beware of implications of populating table in parallel...
- Generalize :code:`host.cpp` to take file of strings for inference and run those through pipeline. Currently unfeasible due to only running hardware emulation (that take a substantial amount of time if reading in all the embeddings needed for inference from a file of text).
- Clean up :code:`stream_hash.cpp` file.
