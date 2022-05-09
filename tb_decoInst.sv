`timescale 1 ps / 1 ps


module tb_decoInst();

logic [25:0] inst;
logic [5:0]opcode;
logic clk = 0, rst, en = 1'b1;
logic [4:0] rd;
logic [4:0] rn;
logic [4:0] rm;
logic [9:0] imm10; 
logic [14:0] imm15; 
logic [19:0] imm20;
logic [15:0] pc_count, new_pc;

decoInst decoInst (
					.clk(clk), 
					.inst(inst), 	
					.opcode(opcode), 
					.rd(rd),
					.rn(rn),
					.rm(rm),
					.imm10(imm10), 
					.imm15(imm15), 
					.imm20(imm20));
					
Rom mem(pc_count,
		clk,
		inst);
		
pc cont(.clk(clk),
		.rst(rst),
		.en(en),
		.new_pc(new_pc),
		.pc_count(pc_count));

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; new_pc = 16'b0; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;
		rst = 1'b0; new_pc = new_pc + 16'b100; #10;

	end
endmodule 