module decoInst (input logic clk, input logic [25:0] inst, output logic opcode);


always @ (posedge clk)
	begin
	//$display("Instruction: %b", inst[25:24]);
	case (inst[25:24])
		2'b00 : $display("operacion de tipo Logico-Aritmetica"); 
		2'b01 : $display("operacion de tipo Memoria");
		2'b10 : $display("operacion de tipo Registro");
		2'b11 : $display("operacion de tipo Branch");
	endcase
	end
endmodule