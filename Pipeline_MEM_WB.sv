module Pipeline_MEM_WB(input logic clk, rst, input logic[7:0] data, input logic [25:0] WD3, 
							output logic clk_new, rst_new, output logic[7:0] data, output logic [25:0] WD3);

always_ff @(posedge clk or posedge rst)
			if(rst) begin
				data_new = 8'b0;
				WD3_new = 26'b0;
			end
			else begin
				data_new = data;
				WD3_new = WD3;
			end
			
endmodule
