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

/////>>>>>> Se requiere una bandera para el flag del branc

//mux_32bits pc_sel (.signalA(signalA), .signalB(signalB), .selector(selector), .result(result));

//Modulo del PC
pc pc_m (.clk(clk), .rst(rst), .en(pc_src), .new_pc(new_pc), .pc_count(pc_count));

//Modulo de las instrucciones
Rom instructionMemory_m (.address(pc_count), .clock(clk), .q(inst));

//::::
Pipeline_IF_ID pipelineFetch (.clk(clk), .rst(rst), .q(inst),
										.pc_count(pc_count), .q_new(inst_new), .pc_count_new(pc_count_new));
//:::: 

//Modulo del decodificador
decoInst decoInst_m (.clk(clk), .inst(inst_new), .opcode(opcode), .rd(rd), .rn(rn), 
							.rm(rm), .imm10(imm10), .imm15(imm15), .imm20(imm20));

							
Control_Unit CU(.opcode(opcode), .pc_src(pc_src), .mem_to_reg(mem_to_reg),
					.mem_write(mem_write), .alu_control(alu_control),
					.imm_src(imm_src), .reg_write(reg_write));
							
logic [31:0] WD3;
logic [31:0] RD1, RD2;
logic [31:0] registerBank[31:0];
//logic we_RF;
							
//Modulo del banco de registros
registerMemory registerMemory_m (.clk(clk), .rst(rst), .we_RF(reg_write), .A1(rn), .A2(rm), .A3(A3), 
											.WD3(WD3), .RD1(RD1), .RD2(RD2), .registerBank(registerBank));


//:::::
//Pipeline
//:::::	Entra alu_control sale la senial sostenida								
alu ALU_TB(.alu_ctrl(alu_control),.srcA(RD1),.srcB(RD2),.result(result));

//:::::
//Pipeline
//:::::

//RAM

always #5 clk = ~clk;

initial
	begin
	
		rst = 1'b1; 
		we_RF = 1;
		for (int i = 0; i<32; i++)
			begin
				WD3 = i;
				A3 = i;
				#10;
			end
		we_RF = 0;
		#10;
		rst = 1'b0;

	end

endmodule
