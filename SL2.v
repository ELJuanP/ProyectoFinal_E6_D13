`timescale 1ns/1ns

module ShiftLeft(
    input [31:0]A,
    output [31:0]B

);

assign B=A<<2;

endmodule