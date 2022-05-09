module Pipeline_IF_ID(input clk, rst,
					  input logic[25:0] q,
					  input logic [15:0] pc_count,
					  output logic[25:0] q_new, 
					  output logic[15:0] pc_count_new);
		
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				q_new = 26'b0;
				pc_count_new = 16'b0;
			end
			else begin
				q_new = q;
				pc_count_new = pc_count;
			end

endmodule 