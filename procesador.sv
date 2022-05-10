`timescale 1 ps / 1 ps

module procesador();

logic clk = 0; 
logic rst;
logic [25:0] inst, inst_new;
logic [5:0]opcode;
logic [4:0] rd;
logic [4:0] rn;
logic [4:0] rm;
logic [9:0] imm10; 
logic [14:0] imm15; 
logic [19:0] imm20;
logic [15:0] pc_count, new_pc, pc_count_new;

//Modulo del PC

//Modulo de las instrucciones
Rom instructionMemory_m (.address(pc_count), .clock(clk), .q(inst));

//::::
Pipeline_IF_ID pipelineFetch (.clk(clk), .rst(rst), .q(inst),
										.pc_count(pc_count), .q_new(inst_new), .pc_count_new(pc_count_new));
//:::: 

//Modulo del decodificador
decoInst decoInst_m (.clk(clk), .inst(inst), .opcode(opcode), .rd(rd), .rn(rn), 
							.rm(rm), .imm10(imm10), .imm15(imm15), .imm20(imm20));
							
//Modulo del banco de registros
//registerMemory registerMemory_m (.clk(clk), .rst(rst), .we_RF(we_RF), .A1(A1), .A2(A2), .A3(A3), 
//											.WD3(WD3), .RD1(RD1), .RD2(RD2), .registerBank(registerBank));


//:::::
//Pipeline_ID_Ex pipelineExecution
//:::::

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; #10;
		rst = 1'b0;

	end

endmodule
