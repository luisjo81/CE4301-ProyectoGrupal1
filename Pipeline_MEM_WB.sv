module Pipeline_MEM_WB(
					input 	logic clk, rst, 
					input 	logic	[31:0] data, 
					input 	logic [31:0] aluRes,
					input 	logic	reg_write,
					input 	logic [1:0] men2reg,
					input 	logic [31:0] signImm,
					output 	logic [31:0] signImm_new,
					output 	logic [1:0] men2reg_new,
					output	logic reg_write_new,
					output 	logic	[31:0] data_new, 
					output 	logic [31:0] aluRes_new);

always_ff @(posedge clk or posedge rst)
			if(rst) begin
				reg_write_new = 2'b00;
				data_new = 32'b0;
				aluRes_new = 32'b0;
				signImm_new = 32'b0;
			end
			else begin
				data_new = data;
				aluRes_new = aluRes;
				men2reg_new = men2reg;
				reg_write_new = reg_write;
				signImm_new = signImm;
			end
			
endmodule
