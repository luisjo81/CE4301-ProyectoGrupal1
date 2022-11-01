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
	output logic [14:0] imm15 ,
	output logic [24:20] imm25 ,
	output logic [4:0] vd ,
	output logic [4:0] vn ,
	output logic [4:0] vm ,
	output logic [14:0] vimm15
	);


always @ (negedge clk)
	begin
		case (inst[31:30])
		//Operaciones Aritmeticas
		2'b00 : 
			begin
				opcode = inst[31:25] ;
				case (inst[29])
					1'b0:
						begin
						case (inst[28])
							1'b0: imm15 = inst[14:0] ;
							default: 
								begin
									rd = inst[24:20] ;
									rn = inst[19:15] ;
									rm	= inst[14:10] ;
								end
						endcase
						end
					default:
						begin
						case (inst[28])
						1'b0: vimm15 = inst[14:0] ;
						default: 
							begin
								vd = inst[24:20] ;
								vn = inst[19:15] ;
								vm	= inst[14:10] ;
							end
						endcase
						end
				endcase
			end
		2'b01 :
			begin	
				opcode = inst[31:25];
				case (inst[29])
					1'b0:
					begin
						rd = inst[24:20] ;
						rn = inst[19:15] ;
						case (inst[28])
						1'b0 : 
							begin
								rm = inst[14:10] ;
							end
						1'b1 : 
							begin
								imm15 = inst[14:0] ;
							end
						endcase
					end
					default:
					begin
						vd = inst[24:20] ;
						vn = inst[19:15] ;
						case (inst[28])
						1'b0 : vm = inst[14:10] ;
						1'b1 : vimm15 = inst[14:0] ;
						endcase
					end
				endcase
			end
		2'b10 :
			begin
				opcode = inst[31:25] ;
				case(inst[29])
					1'b0:
					begin
						rd = inst[24:20] ;
						rn = inst[19:15] ;
						imm15 = inst[14:0] ;
					end
					default:
					begin
						vd = inst[24:20] ;
						vn = inst[19:15] ;
						vimm15 = inst[14:0] ;
					end
				endcase
			end
		2'b11 :
			begin
				opcode = inst[31:25] ;
				case (inst[28])
				1'b0 : 
				begin
					rd = inst[24:20] ;
					rn = inst[19:15] ;
					imm15 = inst[14:0];
				end
				1'b1 : imm25 = inst[24:0];
				endcase
			end
		endcase
	end
endmodule
