module decoInst (
//Entradas:
	input logic clk, 
	input logic [25:0] inst, 
//Salidas: 
	output logic [5:0] opcode,
	output logic [4:0] rd ,
	output logic [4:0] rn ,
	output logic [4:0] rm ,
	output logic [9:0] imm10, 
	output logic [14:0] imm15, 
	output logic [19:0] imm20
	
	);


always @ (posedge clk)
	begin
	//$display("Instruction: %b", inst[25:24]);
	case (inst[25:24])
		2'b00 : 
			begin
				$display("operacion de tipo Logico-Aritmetica");
				opcode = inst[25:20] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[23])
					1'b0 : 
					begin
						$display("::::::operacion de registros");
						rm = inst[9:5] ;
					end
					1'b1 : 
					begin
						$display("::::::operacion de inmediatos");
						imm10 = inst[9:0] ;
					end
				endcase
			end
		2'b01 :
			begin	
				$display("operacion de tipo Memoria");
				opcode = inst[25:20] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[23])
				1'b0 : $display("::::::operacion de registros");
				1'b1 : $display("::::::operacion de inmediatos");
				endcase
			end
		2'b10 :
			begin
				$display("operacion de tipo Registro");
				case (inst[23])
				1'b0 : $display("::::::operacion de registros");
				1'b1 : $display("::::::operacion de inmediatos");
				endcase
			end
		2'b11 :
			begin
				$display("operacion de tipo Branch");
				case (inst[23])
				1'b0 : $display("::::::operacion de registros");
				1'b1 : $display("::::::operacion de inmediatos");
				endcase
			end
	endcase
	end
endmodule
