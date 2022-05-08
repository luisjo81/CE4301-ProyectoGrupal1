module or_op #(parameter N=32)
(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [N-1:0] result
 // output logic [3:0] flags
);

  assign result = a | b;
  
endmodule