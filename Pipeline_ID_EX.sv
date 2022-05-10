module Pipeline_ID_EX(input clk, rst,
					  input logic [15:0] pc_count,
					  input logic [25:0] RD1, RD2, signImm	
					  input logic [25:0] registerBank[12:0],
					  output logic [15:0] pc_count_new,
					  output logic [25:0] RD1_new, RD2_new, signImm_new,	
					  output logic [25:0] registerBank_new[12:0]);
					  
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				pc_count_new = 16'b0;
				RD1_new = 26'b0;
				RD2_new = 26'b0;
				signImm_new = 26'b0; 
				registerBank_new = 26'b0;
			end
			else begin
				pc_count_new = pc_count;
				RD1_new = RD1;
				RD2_new = RD2;
				signImm_new = signImm; 
				registerBank_new = registerBank;
			end

endmodule 