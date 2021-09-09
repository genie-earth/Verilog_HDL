# Memory


---
### BRAM (Block random access memory)
* A primitive cell that acts as SRAM in Xilinx FPGA.
* Single Port RAM (SPRAM): An operation that is possible by accessing memory in 1 cycle is read or write. (Impossible to read/write at the same time)
* Dual Port RAM (DPRAM) : It is possible to read/write at the same time. (Area is larger than SPRAM)


---
### Memory interface
* Memory size = Data width * Depth
* Width: The size of data that can be accessed during 1 cycle.
* Depth: The number of data that can be accessed through address.
* Access to memory is made through address.


---
### Waveform
![](https://github.com/genie-earth/Verilog_HDL/blob/main/7_simple_memory_controller/waveform_1.jpg)
![](https://github.com/genie-earth/Verilog_HDL/blob/main/7_simple_memory_controller/waveform_2.jpg)
![](https://github.com/genie-earth/Verilog_HDL/blob/main/7_simple_memory_controller/waveform_3.jpg)
