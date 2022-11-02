module extend
(
	input logic [1:0] imm_src,
	input logic [14:0] imm,
	input logic [24:0] imm2,
	output logic [31:0] result
	
);

	logic [31:0] temp_extend;

	
	always @(*)
		begin
			
			case(imm_src)
			
				0:
					begin
						 temp_extend ={17'd0, imm2[14:0]};
					end
					
				1:
					begin
						 temp_extend ={7'd0, imm2[24:0]};
					end
				
				default: temp_extend = 32'd0;
					
			endcase
			
		end

	
	
	assign result = temp_extend;

endmodule