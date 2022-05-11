module tb_Control_Unit();

logic [5:0] opcode;
logic [1:0] imm_src;
logic [4:0] alu_control;
logic pc_src, mem_to_reg, mem_write, reg_write;



Control_Unit CU(.opcode(opcode), .pc_src(pc_src), .mem_to_reg(mem_to_reg),
					.mem_write(mem_write), .alu_control(alu_control),
					.imm_src(imm_src), .reg_write(reg_write));
					
					
initial 

begin

for (int i = 0; i<6'b111111;i++)
	begin
	
	opcode = i; #10;
	
	end


end			


endmodule
