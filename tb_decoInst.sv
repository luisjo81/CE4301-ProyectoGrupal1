//`timescale 1 ps / 1 ps


module tb_decoInst();

logic [25:0] inst, inst_new;
logic [5:0]opcode;
logic clk = 0, rst, en = 1'b1;
logic [4:0] rd;
logic [4:0] rn;
logic [4:0] rm;
logic [9:0] imm10; 
logic [14:0] imm15; 
logic [19:0] imm20;
logic [15:0] pc_count, new_pc, pc_count_new;

decoInst decoInst (clk, inst_new, opcode, rd, rn, rm, imm10, imm15, imm20);
					
Rom mem(pc_count, clk, inst);
		
pc cont(clk, rst, en, new_pc, pc_count);
		
Pipeline_IF_ID pipelineFetch(clk, rst, inst, pc_count, inst_new, pc_count_new);

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; new_pc = 16'b0; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;
		rst = 1'b0; new_pc = new_pc + 16'b1; #10;

	end
endmodule 