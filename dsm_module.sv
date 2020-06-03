//////////////////////////////////////////////////////////////////
// Name File	: dsm_module.sv									//
// Autor		: Serhii Yatsenko								//
// Mail			: royalroad1995@gmail.com						//
// Description	: SystemVerilog module of the					//
// 				  First-Order Delta-Sigma Modulator				//
//				  (Synthesizable Digital Core)					//
// Date			: 2020											//
// License		: MIT											//
//////////////////////////////////////////////////////////////////

module dsm_module #(
	parameter DATA_WIDTH = 8
)(
	input	logic					clk_i, rst_i,
	input	logic [DATA_WIDTH-1:0]	data_i,
	output	logic 					data_o
);
	logic [DATA_WIDTH+1:0] delta, sigma, sigma_latched, delta_b;

	assign	delta_b	= {2{sigma_latched[DATA_WIDTH+1]}} << DATA_WIDTH,
			delta	= data_i + delta_b,
			sigma	= delta + sigma_latched;

	always_ff @(posedge clk_i, posedge rst_i) begin
		if(rst_i) begin
			sigma_latched	<= 0; //1'b1 << DATA_WIDTH;
			data_o			<= 0;
		end else begin
			sigma_latched	<= sigma;
			data_o			<= sigma_latched[DATA_WIDTH+1];
		end
	end
	
endmodule: dsm_module
