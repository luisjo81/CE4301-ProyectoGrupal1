`timescale 1 ps / 1 ps

module pc #(parameter N=16)
(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [N-1:0] pc_branch,
	output logic [N-1:0] pc_count
);

//logic [N-1:0] pc_aux;

		
		always_ff @ (negedge clk or posedge rst)
			if(rst) pc_count = 16'b0;
			else
			begin
				if(en) pc_count = pc_branch;
				else pc_count = pc_count+1;
			end

	
endmodule
