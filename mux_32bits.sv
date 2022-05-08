module mux_32bits #(parameter N=32)
(
	input [N-1:0] signalA, signalB,
	input selector,
	output [N-1:0] result
);

assign result = selector ? signalB : signalA;

endmodule 