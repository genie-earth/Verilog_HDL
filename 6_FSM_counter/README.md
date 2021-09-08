# FSM with counter


---
### FSM (Finite-state machine)
* Sequential logic used in many digital systems to control the behavior of systems and dataflow paths.
* An FSM logic has only one state at the same time, and state can be transitted to another state by specific event.
* Simple control logic can be designed without using FSM, with if-else statement,
* but FSM is very easy to design control logic because it accurately specifies the current state and is described to operate by input.


---
### Types of FSM
* Mealy model: When determining the external output, both the input and the current state are affected.
* Moore model: When determining the external output, the input does not intervene, and only the current state is considered.
* The Mealy model is disadvantageous in timing or delay because the input can affect the output.
* If the output does not go through F/F, malfunctions such as noise or glitch may occur.


---
### Waveform
![](https://github.com/genie-earth/Verilog_HDL/blob/main/6_FSM_counter/waveform_1.jpg)
![](https://github.com/genie-earth/Verilog_HDL/blob/main/6_FSM_counter/waveform_2.jpg)
