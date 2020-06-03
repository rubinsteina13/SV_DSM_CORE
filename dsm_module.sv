/**
  ***********************************************************************************
  * @file    dsm_module.sv
  * @author  Serhii Yatsenko [royalroad1995@gmail.com]
  * @version V1.0
  * @date    May-2020
  * @brief   Synthesizable Digital Core of the First-Order Delta-Sigma Modulator.
  *	     This desing provided as SystemVerilog representation of the Virtex (TM)
  *	     Synthesizable Delta-Sigma DAC by Xilinx:
  *	     https://www.xilinx.com/support/documentation/application_notes/xapp154.pdf
  ***********************************************************************************
  * @license
  *
  * MIT License
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
  * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  * copies of the Software, and to permit persons to whom the Software is
  * furnished to do so, subject to the following conditions:
  *
  * The above copyright notice and this permission notice shall be included in all
  * copies or substantial portions of the Software.
  *
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
  ***********************************************************************************
  */

module dsm_module #(
	parameter DATA_WIDTH = 8
)(
	input	logic			clk_i, rst_i,
	input	logic [DATA_WIDTH-1:0]	data_i,
	output	logic 			data_o
);
	logic [DATA_WIDTH+1:0] delta, sigma, sigma_latched, delta_b;

	assign	delta_b	= {2{sigma_latched[DATA_WIDTH+1]}} << DATA_WIDTH,
		delta	= data_i + delta_b,
		sigma	= delta + sigma_latched;
	
	always_ff @(posedge clk_i, posedge rst_i) begin
		if(rst_i) begin
			sigma_latched	<= 0;
			data_o		<= 0;
		end else begin
			sigma_latched	<= sigma;
			data_o		<= sigma_latched[DATA_WIDTH+1];
		end
	end
	
endmodule: dsm_module
