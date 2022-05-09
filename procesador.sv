module procesador(input logic clk);





//Modulo del PC

//Modulo de las instrucciones

//:::: 

//Modulo del decodificador
decoInst decoInst_m (.clk(clk), .inst(inst), .opcode(opcode), .rd(rd), .rn(rn), 
							.rm(rm), .imm10(imm10), .imm15(imm15), .imm20(imm20));
endmodule
