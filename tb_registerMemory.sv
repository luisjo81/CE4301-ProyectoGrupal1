module tb_registerMemory();

logic rst, clk = 0, we_RF;
logic [4:0] A1, A2, A3;
logic [31:0] WD3;
logic [31:0] RD1, RD2;
logic [31:0] registerBank[31:0];

registerMemory registerMemory_m(clk, rst, we_RF, A1, A2, A3, WD3, RD1, RD2, registerBank);


always #5 clk = ~clk;

initial 
	begin
		
		we_RF = 1;
		
		for (int i = 0; i<32; i++)
			begin
				WD3 = i;
				A3 = i;
				#10;
			end
		
		we_RF = 0;
		for (int i = 0; i<32; i++)
			begin
				A1 = i;
				A2 = i;
				#10;
			end
		
	
	end


endmodule
