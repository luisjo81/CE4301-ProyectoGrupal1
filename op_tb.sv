module op_tb();

	//inputs
	logic [31:0] srcA;
	logic [31:0] srcB;
	logic [31:0] result;

	
	//je_op JEQ_TB(srcA,srcB,result);
	//jgt_op JG_TB(srcA,srcB,result);
	mult_op #(32) Multi(srcA, srcB, result);
	
	
	initial begin
	#40
	
	srcA=32'd10;
	srcB=32'd5;
	#40
	
	srcA=32'd17;
	srcB=	32'd3;

	
	end

endmodule 