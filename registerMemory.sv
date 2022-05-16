module registerMemory(clk, rst, we_RF, A1, A2, A3, WD3, RD1, RD2, registerBank);

input logic rst, clk, we_RF;
input logic [4:0] A1, A2, A3;
input logic [31:0] WD3;

output logic [31:0] RD1, RD2;
output logic [31:0] registerBank[31:0] = '{32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
														 32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
														 32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,32'b0,
														 32'b0,32'b0};

always@(posedge clk) 
	begin
		if(!we_RF) begin
			RD1 = registerBank [A1];
			RD2 = registerBank [A2];
			$display("RD1, %b", registerBank [A1]);
			$display("RD2, %b", registerBank [A2]);
					
	end
end

always@(negedge clk) 
	begin
		if(we_RF)
			begin
			registerBank [A3] = WD3;
			$display("RD3, %b", registerBank [A3]);
			end
	end
		
endmodule
