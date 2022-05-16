module Pipeline_ID_EX(input logic clk, rst, mem_write, alu_src,reg_write,
						input logic [4:0] alu_control,
						input logic [31:0] pc_count,
						input logic [31:0] RD1, RD2, signImm,
						input logic [1:0] mem_to_reg,
						input logic [4:0] rd,
						output logic [4:0] rd_new,
						output logic mem_write_new, alu_src_new,reg_write_new,
						output logic [1:0] mem_to_reg_new,
						output logic [4:0] alu_control_new,
						output logic [31:0] pc_count_new,
						output logic [31:0] RD1_new, RD2_new, signImm_new);
					  
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				mem_to_reg_new = 2'b0;
				mem_write_new = 1'b0;
				reg_write_new = 1'b0;
				alu_control_new = 5'b0;
				pc_count_new = 31'b0;
				RD1_new = 32'b0;
				RD2_new = 32'b0;
				signImm_new = 32'b0; 
				rd_new = 5'b0;
			end
			else begin
				mem_to_reg_new = mem_to_reg;
				mem_write_new = mem_write;
				alu_control_new = alu_control;
				pc_count_new = pc_count+signImm;
				RD1_new = RD1;
				RD2_new = RD2;
				signImm_new = signImm;
				reg_write_new = reg_write;
				rd_new = rd;
			end

endmodule 