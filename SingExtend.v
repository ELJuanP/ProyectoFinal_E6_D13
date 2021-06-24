`timescale 1ns/1ns

module SignExtend(
    input [15:0]SignInput,
    output [31:0]Extend

);

assign Extend = {{16{SignInput[15]}},SignInput};

endmodule

