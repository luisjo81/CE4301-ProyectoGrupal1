module Pipeline_IF_ID(input clk, rst,
					  input logic [31:0] q, pc_count,
					  output logic[31:0] q_new, pc_count_new);
		
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				q_new = 32'b0;
				pc_count_new = 32'b0;
			end
			else begin
				q_new = q;
				pc_count_new = pc_count;
			end

endmodule 