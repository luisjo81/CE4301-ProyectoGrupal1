module adder #(parameter N=16)
(
	input logic [N-1:0] signalA, 
	output logic [N-1:0] result
);

	assign result = signalA + 1'd1;

endmodule