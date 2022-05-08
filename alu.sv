module alu #(parameter N=32)
(
	input logic [3:0] alu_ctrl,
	input logic [N-1:0] src_A,
	input logic [N-1:0] src_B,
	output logic [N-1:0] alu_result
	//output logic [3:0] alu_flags // los bits representan los flags 3->(Z) 2->(N) 1->(C) 0->(V).
);

 // Resultados temporales - temp results
	logic [N-1:0]temp_result_and;
	logic [N-1:0]temp_result_xor;
	logic [N-1:0]temp_result_substract;
	logic [N-1:0]temp_result_add;
	logic [N-1:0]temp_result_or;
	logic [N-1:0]temp_result_move;
	logic [N-1:0]temp_result_not;

// Flags temporales - temp flags
/*
	logic [3:0]temp_flag_and;
	logic [3:0]temp_flag_xor;
	logic [3:0]temp_flag_substract;
	logic [3:0]temp_flag_rev_sub;
	logic [3:0]temp_flag_add;
	logic [3:0]temp_flag_compare;
	logic [3:0]temp_flag_comp_neg;
	logic [3:0]temp_flag_or;
	logic [3:0]temp_flag_move;
	logic [3:0]temp_flag_sll;
	logic [3:0]temp_flag_srl;
	logic [3:0]temp_flag_clear; // nand
	logic [3:0]temp_flag_not;
	*/

// Variable de resultado final y flag final
	logic [N-1:0]TRESULT;
	//logic [3:0]TFLAGS;


  //"Instancias" de las operaciones 
  
	and_op AND_OP(src_A, src_B, temp_result_and, temp_flag_and); // AND
	xor_op XOR_OP(src_A, src_B, temp_result_xor, temp_flag_xor); // XOR
	sub_op SUB_OP(src_A, src_B, temp_result_substract, temp_flag_substract); // SUB
	add_op ADD_OP(src_A, src_B, temp_result_add, temp_flag_add); // ADD
	or_op OR_OP(src_A, src_B, temp_result_or, temp_flag_or); // OR
	move_op MOVE_OP(src_B, temp_result_move, temp_flag_move); // MOVE
	not_op NOT_OP(src_A, temp_result_not, temp_flag_not); // NOT

  
    always @(*) //cualquier cambio que haya en las entradas, haga tal vara

      begin	

        case (alu_ctrl)
          0 : begin 
				   TRESULT = temp_result_and;
				   //TFLAGS = temp_flag_and;
				  end

          1 : begin 
				   TRESULT = temp_result_xor;
				   //TFLAGS = temp_flag_xor;
				  end
		
          2 : begin 
				   TRESULT = temp_result_substract;
				   //TFLAGS = temp_flag_substract;
				  end

          3 : begin 
				   TRESULT = temp_result_add;
				   //TFLAGS = temp_flag_add;
				  end

          4 : begin 
				   TRESULT = temp_result_move;
				   //TFLAGS = temp_flag_move;
				  end

          5 : begin 
				   TRESULT = temp_result_not;
				   //TFLAGS = temp_flag_not;
				  end			  

			 default : begin 
				   TRESULT = 32'd0;
				   //TFLAGS = 4'b0000;
				  end
      endcase
	  end
	
	assign alu_result = TRESULT;
	//assign alu_flags = TFLAGS;





endmodule