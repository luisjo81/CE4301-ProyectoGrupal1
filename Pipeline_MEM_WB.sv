module Pipeline_MEM_WB(
					input 	logic clk, rst, 
					input 	logic	[47:0] data, aluResV, 
					input 	logic [31:0] aluRes,
					input 	logic	reg_write,
					input 	logic [1:0] men2reg,
					input 	logic [31:0] signImm,
					input 	logic [4:0] rd, vd
					output 	logic [4:0] rd_new, vd_new
					output 	logic [31:0] signImm_new,
					output 	logic [1:0] men2reg_new,
					output	logic reg_write_new,
					output 	logic	[47:0] data_new, aluResV_new, 
					output 	logic [31:0] aluRes_new);

always_ff @(posedge clk or posedge rst)
			if(rst) begin
				reg_write_new = 2'b00;
				data_new = 48'b0;
				aluRes_new = 32'b0;
				signImm_new = 32'b0;
				rd_new = 5'b0;
				vd_new = 5'b0;
				aluResv_new = 48'b0;
			end
			else begin
				data_new = data;
				aluRes_new = aluRes;
				men2reg_new = men2reg;
				reg_write_new = reg_write;
				signImm_new = signImm;
				rd_new = rd;
				vd_new = vd;
				aluResV_new = aluResV;
			end
			
endmodule
