module Pipeline_EX_MEM(input logic clk, rst, mem_write,reg_write,
							input logic [31:0] pc_count, 
							input logic [31:0] RD2, aluResult,
							input logic [1:0] mem_to_reg,
							input logic [31:0] signImm,
							input logic [4:0] rd,
							output logic [4:0] rd_new,
							output logic [31:0] signImm_new,
							output logic [1:0] mem_to_reg_new,
							output logic mem_write_new, reg_write_new,
							output logic [31:0] pc_count_new,
							output logic [31:0] RD2_new, aluResult_new);
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				mem_to_reg_new = 1'b00;
				mem_write_new = 1'b0;
				reg_write_new = 1'b0;
				pc_count_new = 32'b0;
				RD2_new = 32'b0;
				aluResult_new = 32'b0;
				signImm_new = 32'b0;
				rd_new = 5'b0;
			end
			else begin
				mem_to_reg_new = mem_to_reg;
				mem_write_new = mem_write;
				pc_count_new = pc_count;
				RD2_new = RD2;
				aluResult_new = aluResult;
				reg_write_new = reg_write;
				signImm_new = signImm;
				rd_new = rd;
			end

endmodule
