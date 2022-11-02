`timescale 1 ps / 1 ps
module tb_procesador();


logic clk = 0; 
logic rst;

//User selection
logic [1:0] r_value; //RED
logic [1:0] g_value;	//GREEN
logic [1:0] b_value;	//BLUE
logic [1:0] t_value;	//TRANSPARENCY
logic  o_value;		//ORIENTATION

procesador proce (.clk(clk), .rst(rst), 
						.r_value(r_value), .g_value(g_value), .b_value(b_value), 
						.t_value(t_value), .o_value(o_value));

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; 
		#10;
		rst = 1'b0;

	end



endmodule
