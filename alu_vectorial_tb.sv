module alu_vectorial_tb ();

	
	logic [4:0] alu_ctrl;
	logic [47:0] src_A;
	logic [47:0] src_B;
	logic [47:0] alu_result;
	
	alu_vectorial #(48) alv(alu_ctrl, src_A, src_B, alu_result);
	
	initial begin
	#40
	
	alu_ctrl=5'd1;//ADD
	src_A=48'd1;
	src_B=48'd5;
	#40
	
	alu_ctrl=5'd2;//SUB
	src_A=48'd2;
	src_B=48'd1;
	
	
	#40
	
	alu_ctrl=5'd3;//MUL
	src_A=48'd2;
	src_B=48'd8;
	
	
	#40
	
	alu_ctrl=5'd4;//MOVE
	src_A=48'd15;
	
	#40
	
	alu_ctrl=5'd5;//DIV
	src_A=48'd16;
	src_B=	48'd4;
	#40
	
	alu_ctrl=5'd6;//LNUM
	src_A=48'd134941186; // 00001000  00001011   00001010   00000010
	src_B=	48'd3; // deberia devolver un 10
	#40
	
	
	alu_ctrl=5'd9;//AND
	src_A=48'd1;
	src_B=	48'd1;
	
	#40
	
	alu_ctrl=5'd10;//OR
	src_A=48'd0;
	src_B=	48'd1;
	
		
	#40
	
	alu_ctrl=5'd11;//XOR
	src_A=48'd0;
	src_B=	48'd1;
	
	#40
	
	alu_ctrl=5'd12;//NOT
	src_A=48'd0;
	
	end
	
endmodule 