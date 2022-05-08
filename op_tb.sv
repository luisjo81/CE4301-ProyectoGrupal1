module op_tb();

	//inputs
	logic [31:0] srcA;
	logic [31:0] srcB;
	logic [31:0] result;

	
	add ADD_TB(srcA,srcB,result);
	
	initial begin
	#40
	
	srcA=32'd3;
	srcB=32'd5;
	#40
	
	srcA=32'd1;
	srcB=	32'd1;;



	
	end

endmodule 