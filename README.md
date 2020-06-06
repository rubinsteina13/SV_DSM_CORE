# Synthesizable SystemVerilog IP-Core of the First-Order Delta-Sigma Modulator

This Synthesizable IP-Core of First-Order Delta-Sigma Modulator is a SystemVerilog representation of the [Virtex (TM) Synthesizable Delta-Sigma DAC by Xilinx](https://www.xilinx.com/support/documentation/application_notes/xapp154.pdf).

* Project structure
	* README.md - current file
	* LICENSE - file with license description
  * dsm_module.sv - Synthesizable Digital IP-Core of the First-Order Delta-Sigma Modulator

# dsm_module description

* User constants
  * DATA_WIDTH - input and output data bus resolution
* Inputs
  * clk_i - clock signal (active is rising edge)
  * rst_i - reset signal (active level is high)
  * data_i - input data bus
* Outputs
  * data_o - output data bus
  
# License
  
[MIT](./LICENSE "License Description")
