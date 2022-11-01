//`timescale 1 ps / 1 ps

module decoInst (
//Entradas:
	input logic clk, 
	input logic [32:0] inst, 
//Salidas: 
	output logic [6:0] opcode,
	output logic [4:0] rd ,
	output logic [4:0] rn ,
	output logic [4:0] rm , 
	output logic [14:0] imm15
	);


always @ (negedge clk)
	begin
	case (inst[31:30])
	//Operaciones Aritmeticas
		2'b00 : 
			begin
				opcode = inst[31:25] ;
				case (inst[28])
					1'b0: imm15 = inst[15:0] ;
					default: 
					begin
						rd = inst[24:20] ;
						rn = inst[19:15] ;
						rm	= inst[14:10] ;
					end
				endcase
			end
		2'b01 :
			begin	
				opcode = inst[31:25] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[28])
				1'b0 : 
					begin
						rm = inst[9:5] ;
					end
					1'b1 : 
					begin
						imm15 = inst[9:0] ;
					end
				endcase
			end
		2'b10 :
			begin
				opcode = inst[25:20] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[23])
				1'b0 : 
				begin
					imm10 = inst[9:0];
				end
				endcase
			end
		2'b11 :
			begin
				opcode = inst[25:20] ;
				case (inst[23])
				1'b0 : 
				begin
					rd = inst[19:15] ;
					rn = inst[14:10] ;
					imm10 = inst[9:0];
				end
				1'b1 : 
				begin
					imm20 = inst[19:0];
				end
				endcase
			end
	endcase
	end
endmodule
