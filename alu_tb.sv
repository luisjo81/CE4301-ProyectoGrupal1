module alu_tb();

	//inputs
	logic [4:0] alu_ctrl;
	logic [31:0] srcA;
	logic [31:0] srcB;
	logic [31:0] result;
	logic [3:0] alu_flags;

	
	alu ALU_TB(alu_ctrl,srcA,srcB,result);
	
	initial begin
	#40
	
	alu_ctrl=5'd1;//ADD
	srcA=32'd1;
	srcB=32'd5;
	#40
	
	alu_ctrl=5'd2;//SUB
	srcA=32'd2;
	srcB=	32'd1;
	
	
	#40
	
	alu_ctrl=5'd3;//MUL
	srcA=32'd2;
	srcB=	32'd8;
	
	
	#40
	
	alu_ctrl=5'd4;//MOVE
	srcA=32'd15;
	
	#40
	
	alu_ctrl=5'd5;//DIV
	srcA=32'd16;
	srcB=	32'd4;
	#40
	
	alu_ctrl=5'd6;//LNUM
	srcA=32'd134941186; // 00001000  00001011   00001010   00000010
	srcB=	32'd3; // deberia devolver un 10
	#40
	
	
	alu_ctrl=5'd9;//AND
	srcA=32'd1;
	srcB=	32'd1;
	
	#40
	
	alu_ctrl=5'd10;//OR
	srcA=32'd0;
	srcB=	32'd1;
	
		
	#40
	
	alu_ctrl=5'd11;//XOR
	srcA=32'd0;
	srcB=	32'd1;
	
	#40
	
	alu_ctrl=5'd12;//NOT
	srcA=32'd0;
	
	



	
	end

endmodule