`timescale 1 ps / 1 ps

module procesador(input logic clk, rst, output logic [31:0] WD3);

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
logic [15:0] pc_count, new_pc, pc_count_new, pc_count_new2, pc_count_new3;

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

logic mem_to_reg, mem_write, alu_src, mem_to_reg_new, mem_write_new, alu_src_new, mem_to_reg_new2, mem_write_new2;
logic [1:0] imm_src;
logic [4:0] alu_control, alu_control_new;
		
		
Control_Unit CU(.opcode(opcode), .pc_src(pc_src), .mem_to_reg(mem_to_reg),
					.mem_write(mem_write), .alu_control(alu_control),
					.imm_src(imm_src), .reg_write(reg_write));
							
logic [31:0] extendRes, RD1, RD2, extendRes_new, RD1_new, RD2_new;
logic [31:0] registerBank[31:0], alu_Result, RD_res, alu_Result_new, RD_res_new;
//logic we_RF;
							
//Modulo del banco de registros
registerMemory registerMemory_m (.clk(clk), .rst(rst), .we_RF(reg_write), .A1(rn), .A2(rm), .A3(A3), 
											.WD3(WD3), .RD1(RD1), .RD2(RD2), .registerBank(registerBank));

//Módulo de extensión de signo
extend extender(.imm_src(imm_src), .imm(imm10), .imm2(imm15), .imm3(imm20), .result(extendRes));

//:::::
//Pipeline
Pipeline_ID_EX pipelineDecode(.clk(clk), .rst(rst), .mem_to_reg(mem_to_reg),
					.mem_write(mem_write), .alu_src(alu_src), .alu_control(alu_control), 
					.pc_count(pc_count_new), .RD2(RD2), .RD3(RD3), .signImm(extendRes),
					.mem_to_reg_new(mem_to_reg_new), .mem_write_new(mem_write_new), .alu_src_new(alu_src_new),
					.imm_src_new(imm_src_new), .alu_control_new(alu_control_new), .pc_count_new(pc_count_new2), 
					.signImm_new(extendRes_new), RD1_new(RD1_new), RD2_new(RD2_new));

//Mux de 32 Bits para las entradas de la ALU
mux_32bits mux_Reg_Alu(.signalA(RD2_new), .signalB(extendRes_new), .selector(alu_src_new), .result(RD_res))
					
//:::::	Entra alu_control sale la señal sostenida								
alu ALU_TB(.alu_ctrl(alu_control_new), .src_A(RD1_new), .src_B(RD_res), .alu_result(alu_Result));

//:::::
//Pipeline
//:::::
Pipeline_EX_MEM pipelineExecute(.clk(clk), .rst(rst), .mem_to_reg(mem_to_reg_new), mem_write(mem_write_new),
										.pc_count(pc_count_new2), .RD2(RD_res), .aluResult(alu_Result), 
										.mem_to_reg_new(mem_to_reg_new2), .mem_write_new(mem_write_new2), 
										.RD2_new(RD_res_new), .aluResult_new(alu_Result_new));

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
