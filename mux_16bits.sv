module mux_16bits #(parameter N=16)
(
	input [N-1:0] signalA, signalB,
	input selector,
	output [N-1:0] result
);

assign result = selector ? signalB : signalA;

endmodule 