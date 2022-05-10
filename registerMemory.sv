module registerMemory(clk, rst, we_RF, A1, A2, A3, WD3, RD1, RD2, registerBank);

input logic rst, clk, we_RF;
input logic [4:0] A1, A2, A3;
input logic [25:0] WD3;
output logic [25:0] RD1, RD2;

output logic [25:0] registerBank[12:0];

always@(posedge clk) 
	begin
		if(!we_RF) begin
			RD1 = A1;
			RD2 = A2;
	end
end

always@(negedge clk) 
	begin
		if(we_RF)
			registerBank [A3] = WD3;
	end
		
endmodule