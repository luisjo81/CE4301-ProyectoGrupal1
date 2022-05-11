module Pipeline_ID_EX(input logic clk, rst, mem_to_reg, mem_write, alu_src,
						input logic [4:0] alu_control,
						input logic [15:0] pc_count,
						input logic [31:0] RD1, RD2, signImm,
						output logic mem_to_reg_new, mem_write_new, alu_src_new,
						output logic [1:0] imm_src_new,
						output logic [4:0] alu_control_new,
						output logic [15:0] pc_count_new,
						output logic [31:0] RD1_new, RD2_new, signImm_new);
					  
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				mem_to_reg_new = 1'b0;
				mem_write_new = 1'b0;
				alu_control_new = 4'b00;
				pc_count_new = 16'b0;
				RD1_new = 32'b0;
				RD2_new = 32'b0;
				signImm_new = 32'b0; 
			end
			else begin
				mem_to_reg_new = mem_to_reg;
				mem_write_new = mem_write;
				alu_control_new = alu_control;
				pc_count_new = pc_count;
				RD1_new = RD1;
				RD2_new = RD2;
				signImm_new = signImm; 
			end

endmodule 