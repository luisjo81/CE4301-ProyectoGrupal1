module mux_321 #(parameter N=48)
(
	input [N-1:0] signalA, signalB, signalC,
	input [1:0]selector,
	output [N-1:0] result
);

assign result = selector [1] ? (signalC):(selector[0]?signalA:signalB);

//always @ (selector)
//	begin
//	case (selector)
//		2'b00 : result = signalA;
//		2'b01 : result = signalB;
//		2'b10 : result = signalC;
//	endcase
//	end

endmodule 