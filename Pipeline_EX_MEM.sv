module Pipeline_EX_MEM(input logic clk, rst, input logic [31:0] RD2, aluResult, 
							output logic clk_new, rst_new, output logic [31:0] RD2_new, aluResult_new);
		always_ff @(posedge clk or posedge rst)
			if(rst) begin
				RD2_new = 26'b0;
				aluResult_new = 16'b0;
			end
			else begin
				RD2_new = RD2;
				aluResult_new = aluResult;
			end

endmodule
