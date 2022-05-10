module extend
(
	input logic [1:0] imm_src,
	input logic [23:0] imm,
	output logic [31:0] result
	
);

	logic [31:0] temp_extend;

	
	always @(*)
		begin
			
			case(imm_src)
			
				0:
					begin
						 temp_extend ={22'd0, imm[9:0]};
					end
					
				1:
					begin
						 temp_extend ={17'd0, imm[11:0]};
					end
					
				2:
					begin
						 temp_extend ={12'd0, imm[19:0]};
					end
				
				default: temp_extend = 32'd0;
					
			endcase
			
		end

	
	
	assign result = temp_extend;

endmodule