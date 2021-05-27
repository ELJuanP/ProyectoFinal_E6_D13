`timescale 1ns/1ns
module SL2 (
	input [31:0]A,
	output [31:0]C
);

assign C = A << 2;

endmodule