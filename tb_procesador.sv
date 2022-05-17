module tb_procesador();


logic clk = 0; 
logic rst;

procesador_synt proce (.clk(clk), .rst(rst));

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; 
		#10;
		rst = 1'b0;

	end



endmodule
