module Pipeline_EX_MEM(input logic clk, rst, mem_to_reg, mem_write,
							input logic [15:0] pc_count, 
							input logic [31:0] RD2, aluResult, 
							output logic mem_to_reg_new, mem_write_new, 
							output logic [15:0] pc_count_new,
							output logic [31:0] RD2_new, aluResult_new);
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				mem_to_reg_new = 1'b0;
				mem_write_new = 1'b0;
				pc_count_new = 16'b00;
				RD2_new = 32'b0;
				aluResult_new = 32'b0;
			end
			else begin
				mem_to_reg_new = mem_to_reg;
				mem_write_new = mem_write;
				pc_count_new = pc_count;
				RD2_new = RD2;
				aluResult_new = aluResult;
			end

endmodule
