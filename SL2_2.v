`timescale 1ns/1ns

module ShiftLeft_New(
    input [25:0]A,
    output [31:0]B

);

assign B=A<<2;

endmodule