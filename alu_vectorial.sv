module alu_vectorial #(parameter N=48)
(
	input logic [4:0] alu_ctrl,
	input logic [N-1:0] src_A,
	input logic [N-1:0] src_B,
	output logic [N-1:0] alu_result
	//output logic [3:0] alu_flags // los bits representan los flags 3->(Z) 2->(N) 1->(C) 0->(V).
);
	

// Flags temporales - temp flags
/*
	logic [3:0]temp_flag_and;

*/

// Variable de resultado final y flag final
	logic [N-1:0]TRESULT;
	//logic [7:0] TRESULT_1, TRESULT_1, TRESULT_1, TRESULT_1, TRESULT_5, TRESULT_6; 
	//logic [3:0]TFLAG/;


  //"Instancias" de las operaciones 
  alu #(8) ALU_1(alu_ctrl, src_A[7:0], src_B[7:0], TRESULT[7:0]);
  alu #(8) ALU_2(alu_ctrl, src_A[15:8], src_B[15:8], TRESULT[15:8]);
  alu #(8) ALU_3(alu_ctrl, src_A[23:16], src_B[23:16], TRESULT[23:16]);
  alu #(8) ALU_4(alu_ctrl, src_A[31:24], src_B[31:24], TRESULT[31:24]);
  alu #(8) ALU_5(alu_ctrl, src_A[39:32], src_B[39:32], TRESULT[39:32]);
  alu #(8) ALU_6(alu_ctrl, src_A[47:40], src_B[47:40], TRESULT[47:40]);
	
	
	assign alu_result = TRESULT;
	//assign alu_flags = TFLAGS;





endmodule