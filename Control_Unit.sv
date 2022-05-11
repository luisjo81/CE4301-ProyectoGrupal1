module Control_Unit(opcode, pc_src, mem_to_reg, mem_write, alu_control, imm_src, reg_write);

	input logic [5:0] opcode;
	output logic [1:0] imm_src;
	output logic [4:0] alu_control;
	output logic pc_src, mem_to_reg, mem_write, reg_write;

	always @*
	case(opcode)
		//ADD
		6'b000001:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b00001;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//ADDI
		6'b001001:
			begin
			imm_src = 2'b00;
			alu_control = 5'b00001;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//SUB
		6'b000010:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b00010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//SUBI
		6'b001010:
			begin
			imm_src = 2'b00;
			alu_control = 5'b00010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//MUL
		6'b000011:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b00011;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//MULI
		6'b001011:
			begin
			imm_src = 2'b00;
			alu_control = 5'b00011;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//MOV
		6'b000100:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b00100;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//MOVI
		6'b001100:
			begin
			imm_src = 2'b00;
			alu_control = 5'b00100;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//AND
		6'b010001:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b01001;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//ANDI
		6'b011001:
			begin
			imm_src = 2'b01;
			alu_control = 5'b01001;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//OR
		6'b010010:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b01010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//ORI
		6'b011010:
			begin
			imm_src = 2'b01;
			alu_control = 5'b01010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//XOR
		6'b010011:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b01011;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//NOT
		6'b010100:
			begin
			imm_src = 2'bxx;
			alu_control = 5'b01100;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//LDR
		6'b100001:
			begin
			imm_src = 2'b10;
			alu_control = 5'b10001;
			mem_to_reg = 1'b1;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//LDA
		6'b100010:
			begin
			imm_src = 2'b10;
			alu_control = 5'b10010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//STR
		6'b100011:
			begin
			imm_src = 2'b10;
			alu_control = 5'b10011;
			mem_to_reg = 1'b0;
			mem_write = 1'b1;
			reg_write = 1'b1;
			pc_src = 1'b0;
			end
		//JMP
		6'b111000:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11000;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JEQ
		6'b110001:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11001;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JNEQ
		6'b110010:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11010;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JGT
		6'b110011:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11011;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JGE
		6'b110100:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11100;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JLT
		6'b110101:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11101;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
		//JLE
		6'b110110:
			begin
			imm_src = 2'b11;
			alu_control = 5'b11110;
			mem_to_reg = 1'b0;
			mem_write = 1'b0;
			reg_write = 1'b0;
			pc_src = 1'b1;
			end
	endcase
endmodule 