module pc #(parameter N=16)
(
	input logic clk,
	input logic rst,
	input logic en,
	input logic [N-1:0] new_pc,
	output logic [N-1:0] pc_count
);

		always_ff @ (negedge clk or posedge rst)
			if(rst) pc_count = 16'd0;
			else
				if(en) pc_count = new_pc;

endmodule
