//`timescale 1 ps / 1 ps

module pc #(parameter N=32)
(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [N-1:0] pc_branch,
	output logic [N-1:0] pc_count
);

//logic [N-1:0] pc_aux;

		
		always_ff @ (negedge clk or posedge rst)
			if(rst)
			begin
				pc_count = 32'b0;
			end
			else
			begin
				if(en) pc_count = pc_branch;
				else pc_count = pc_count+1;
			end

	
endmodule
