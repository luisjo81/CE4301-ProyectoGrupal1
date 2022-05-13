`timescale 1 ps / 1 ps

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
	case (inst[25:24])
		2'b00 : 
			begin
				opcode = inst[25:20] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[23])
					1'b0 : 
					begin
						rm = inst[9:5] ;
					end
					1'b1 : 
					begin
						imm10 = inst[9:0] ;
					end
				endcase
			end
		2'b01 :
			begin	
				opcode = inst[25:20] ;
				rd = inst[19:15] ;
				rn = inst[14:10] ;
				case (inst[23])
				1'b0 : 
					begin
						rm = inst[9:5] ;
					end
					1'b1 : 
					begin
						imm10 = inst[9:0] ;
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
