module alu #(parameter N=8)
(
	input logic [4:0] alu_ctrl,
	input logic [N-1:0] src_A,
	input logic [N-1:0] src_B,
	output logic [N-1:0] alu_result
	//output logic [3:0] alu_flags // los bits representan los flags 3->(Z) 2->(N) 1->(C) 0->(V).
);

 // Resultados temporales - temp results
	logic [N-1:0]temp_result_add;
	logic [N-1:0]temp_result_sub;
	logic [N-1:0]temp_result_mul;
	logic [N-1:0]temp_result_div;
	logic [N-1:0]temp_result_move;
	logic [N-1:0]temp_result_lnum;
	logic [N-1:0]temp_result_and;
	logic [N-1:0]temp_result_or;
	logic [N-1:0]temp_result_xor;
	logic [N-1:0]temp_result_not;
	logic [N-1:0]temp_result_ldr;
	logic [N-1:0]temp_result_str;
	logic [N-1:0]temp_result_je;
	logic [N-1:0]temp_result_jne;
	logic [N-1:0]temp_result_jgt;
	logic [N-1:0]temp_result_jge;
	logic [N-1:0]temp_result_jlt;
	logic [N-1:0]temp_result_jle;


	

// Flags temporales - temp flags
/*
	logic [3:0]temp_flag_and;

*/

// Variable de resultado final y flag final
	logic [N-1:0]TRESULT;
	//logic [3:0]TFLAGS;


  //"Instancias" de las operaciones 
  
	add_op ADD_OP(src_A, src_B, temp_result_add); // ADD
	sub_op SUB_OP(src_A, src_B, temp_result_sub); // SUB
	mult_op MUL_OP(src_A, src_B, temp_result_mul); //MUL
	div_op DIV_OP(src_A, src_B, temp_result_div); //DIV
	move_op MOVE_OP(src_A, temp_result_move);//MOVE
	load8BitNumber LNUM_OP(src_A,src_B, temp_result_lnum);//LNUM
	and_op AND_OP(src_A, src_B, temp_result_and);//AND
	or_op OR_OP(src_A, src_B, temp_result_or);//OR
	xor_op XOR_OP(src_A, src_B, temp_result_xor);//XOR
	not_op NOT_OP(src_A, temp_result_not);//NOT
	add_op LDR_OP(src_A, src_B, temp_result_ldr); // ADD LDR
	add_op STR_OP(src_A, src_B, temp_result_str); // ADD STR
	je_op JE_OP(src_A, temp_result_je);//JEQ
	jne_op JNE_OP(src_A, temp_result_jne);//JNE
	jgt_op JGT_OP(src_A, temp_result_jgt);//JGT
	jge_op JGE_OP(src_A, temp_result_jge);//JGE
	jlt_op JLT_OP(src_A, temp_result_jlt);//JLT
	jle_op JLE_OP(src_A, temp_result_jle);//JLE
	
	
	

  
    always @(*) //cualquier cambio que haya en las entradas, haga tal vara

      begin	

        case (alu_ctrl)
          1 : begin 
				   TRESULT = temp_result_add;
				  end

          2 : begin 
				   TRESULT = temp_result_sub;
				  end
		
          3 : begin 
				   TRESULT = temp_result_mul;
				  end

          4 : begin 
				   TRESULT = temp_result_move;
				  end
			 
			 5 : begin 
				   TRESULT = temp_result_div;
				  end
				  
			 6 : begin 
				   TRESULT = temp_result_lnum;
				  end

          9 : begin 
				   TRESULT = temp_result_and;
				  end

          10 : begin 
				   TRESULT = temp_result_or;
				  end
				  
          11 : begin 
				   TRESULT = temp_result_xor;
				  end	
				  
          12 : begin 
				   TRESULT = temp_result_not;
				  end
				  
			 17 : begin 
				   TRESULT = temp_result_ldr;
				  end	
				  				  
			 19 : begin 
				   TRESULT = temp_result_str;
				  end	
			
			 25 : begin 
				   TRESULT = temp_result_je;
					end
					
			 26 : begin 
				   TRESULT = temp_result_jne;
					end
					
			 27 : begin 
				   TRESULT = temp_result_jgt;
					end
			
			 28 : begin 
				   TRESULT = temp_result_jge;
					end
					
			 29 : begin 
				   TRESULT = temp_result_jlt;
					end
					
			 30 : begin 
				   TRESULT = temp_result_jle;
					end

			 default : begin 
				   TRESULT = 8'd0;
				   //TFLAGS = 4'b0000;
				  end
      endcase
	  end
	
	assign alu_result = TRESULT;
	//assign alu_flags = TFLAGS;





endmodule