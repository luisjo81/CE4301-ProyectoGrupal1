module load8BitNumber #(parameter N=32)
(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [N-1:0] result
	
);

	
	logic [N-1:0] temp_result;

	
	always @(*)
		begin
			
			case(b)
			
				32'd1:
					begin
						 temp_result ={24'd0, a[7:0]};
					end
					
				32'd2:
					begin
						 temp_result ={24'd0, a[15:8]};
					end
					
				32'd3:
					begin
						 temp_result ={24'd0, a[23:16]};
					end
					
				32'd4:
					begin
						 temp_result ={24'd0, a[31:24]};
					end
				
				default: temp_result = 32'd0;
				
					
			endcase
			$display("temp_result, %b", temp_result);
			$display("b, %b", b);
		end
	
	assign result = temp_result;
	
endmodule
