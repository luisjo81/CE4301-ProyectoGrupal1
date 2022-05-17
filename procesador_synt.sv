//`timescale 1 ps / 1 ps

module procesador_synt(
input logic clk, 
input logic rst
);

//logic clk = 0; 
//logic rst;
logic [31:0] pc_count, pc_count_new, pc_count_new2, pc_count_new3;

//>>>>>>>>> FETCH >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
logic [25:0] inst, inst_new;
//Modulo del PC
pc pc_m (.clk(clk), .rst(rst), .en(pc_src), .pc_branch(pc_count_new2), .pc_count(pc_count));

//Modulo de las instrucciones
Rom instructionMemory_m (.address(pc_count), .clock(clk), .q(inst));
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//::::
Pipeline_IF_ID pipelineFetch (.clk(clk), .rst(rst), .q(inst),
										.pc_count(pc_count), .q_new(inst_new), .pc_count_new(pc_count_new));
//:::: 
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


//>>>>>>>> DECODE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
logic [5:0]opcode;
logic [4:0] rd, rd2, rd3, rd4;
logic [4:0] rn;
logic [4:0] rm;
logic [9:0] imm10; 
logic [14:0] imm15; 
logic [19:0] imm20;
logic [31:0] WD3_new;	
//Modulo del decodificador
decoInst decoInst_m (.clk(clk), .inst(inst_new), .opcode(opcode), .rd(rd), .rn(rn), 
							.rm(rm), .imm10(imm10), .imm15(imm15), .imm20(imm20));

logic [1:0] mem_to_reg, mem_to_reg_new, mem_to_reg_new2, mem_to_reg_new3;
logic mem_write, mem_write_new, mem_write_new2;
logic alu_src, alu_src_new;
logic reg_write, reg_write_new, reg_write_new2, reg_write_new3;

logic [1:0] imm_src;
logic [4:0] alu_control, alu_control_new;
		
		
Control_Unit CU(.opcode(opcode), .pc_src(pc_src), .mem_to_reg(mem_to_reg),
					.mem_write(mem_write), .alu_control(alu_control),
					.imm_src(imm_src), .reg_write(reg_write), .alu_src(alu_src));
							
logic [31:0] extendRes, extendRes_new, RD1, RD2, RD1_new, RD2_new, RD2_new2, signImm_new, signImm_new2;
logic [31:0] registerBank[31:0], alu_Result, alu_Result_new, alu_Result_new2, RD_res, Mem_Out, Mem_Out_new;
//logic we_RF;
							
//Modulo del banco de registros
registerMemory registerMemory_m (.clk(clk), .rst(rst), .we_RF(reg_write_new3), .A1(rn), .A2(rm), .A3(rd4), 
											.WD3(WD3_new), .RD1(RD1), .RD2(RD2), .registerBank(registerBank));

//Módulo de extensión de signo
extend extender(.imm_src(imm_src), .imm(imm10), .imm2(imm15), .imm3(imm20), .result(extendRes));

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//:::::
//Pipeline
Pipeline_ID_EX pipelineDecode(.clk(clk), .rst(rst),
					.mem_to_reg(mem_to_reg), .mem_to_reg_new(mem_to_reg_new),
					.mem_write(mem_write), .mem_write_new(mem_write_new), 	
					.alu_src(alu_src), .alu_src_new(alu_src_new),
					.alu_control(alu_control), .alu_control_new(alu_control_new),
					.pc_count(pc_count_new), .pc_count_new(pc_count_new2), 
					.RD1(RD1), .RD1_new(RD1_new),
					.RD2(RD2), .RD2_new(RD2_new),
					.signImm(extendRes), .signImm_new(extendRes_new),
					.reg_write(reg_write), .reg_write_new(reg_write_new),
					.rd(rd),.rd_new(rd2));

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>> EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>			
					
//Mux de 32 Bits para las entradas de la ALU
mux_32bits mux_Reg_Alu(.signalA(RD2_new), .signalB(extendRes_new), .selector(alu_src_new), .result(RD_res));
					
//:::::	Entra alu_control sale la señal sostenida								
alu ALU(.alu_ctrl(alu_control_new), .src_A(RD1_new), .src_B(RD_res), .alu_result(alu_Result));



//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//:::::
//Pipeline
//:::::
Pipeline_EX_MEM pipelineExecute(.clk(clk), .rst(rst), .mem_to_reg(mem_to_reg_new), .mem_write(mem_write_new),
										.pc_count(pc_count_new2), .RD2(RD2_new), .aluResult(alu_Result), 
										.mem_to_reg_new(mem_to_reg_new2), .mem_write_new(mem_write_new2), .pc_count_new(pc_count_new3), 
										.RD2_new(RD2_new2), .aluResult_new(alu_Result_new), 
										.reg_write(reg_write_new), .reg_write_new(reg_write_new2),
										.signImm(extendRes_new), .signImm_new(signImm_new),
										.rd(rd2),.rd_new(rd3));

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>										

//>>>>>>>>> MEMORY >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
									
//RAM
Ram dataMemory_m(.address(alu_Result_new), .clock(clk), .data(RD2_new2), .wren(mem_write_new2), .q(Mem_Out));

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//:::::
//Pipeline
//:::::

Pipeline_MEM_WB pipelineWB (	.clk(clk), .rst(rst), .data(Mem_Out), .aluRes(alu_Result_new),
										.data_new(Mem_Out_new), .aluRes_new(alu_Result_new2), 
										.men2reg_new (mem_to_reg_new3), .men2reg(mem_to_reg_new2),
										.reg_write(reg_write_new2), .reg_write_new(reg_write_new3),
										.signImm(signImm_new), .signImm_new(signImm_new2), 
										.rd(rd3),.rd_new(rd4));

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>										

//>>>>>>>>> WB >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	



mux_321 mux_Mem_WB(.signalA(Mem_Out_new), .signalB(alu_Result_new2), .signalC(signImm_new2), 
								.selector(mem_to_reg_new3), .result(WD3_new));

//mux_321 mux_Mem_WB(.signalA(32'd5), .signalB(32'd10), .signalC(32'd20), 
//								.selector(mem_to_reg_new3), .result(WD3_new));								


//always #5 clk = ~clk;
//
//initial
//	begin
//	
//		rst = 1'b1; 
//		#10;
//		rst = 1'b0;
//
//	end

endmodule
