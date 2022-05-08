module tb_decoInst();

logic [25:0] inst;
logic opcode;
logic clk = 0;
logic [4:0] rd;
logic [4:0] rn;
logic [4:0] rm;
logic [9:0] imm10; 
logic [14:0] imm15; 
logic [19:0] imm20;

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

always #5 clk = ~clk;

initial
	begin

	inst = 26'b00000000000000000000000011; #10;
	inst = 26'b01000000000000000000000011; #10;
	inst = 26'b11000000000000000000000011; #10;
	inst = 26'b10000000000000000000000011; #10;
	inst = 26'b10000000000000000000000011; #10;

	end
endmodule 