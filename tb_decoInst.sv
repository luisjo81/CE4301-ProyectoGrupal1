module tb_decoInst();

logic [25:0] inst;
logic opcode;
logic clk = 0;

decoInst decoInst (.clk(clk), .inst(inst), .opcode(opcode));

always #10 clk = ~clk;

initial
begin

inst = 26'b00000000000000000000000011;

end

endmodule 