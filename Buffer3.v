`timescale 1ns/1ns

module Buffer3(
	input clk,
	input [31:0]adder2,
	input zero,
	input [31:0]Aluresult,
	input [31:0]ReadData2,
	input [4:0]Mux,
	input [1:0]WB,
	input [2:0]Memoria,
	output reg[31:0]salida_adder2,
	output reg salida_zero,
	output reg[31:0] salida_Aluresult,
	output reg[31:0] salida_ReadData2,
	output reg[4:0]salida_Mux,
	output reg[1:0]salida_WB,
	output reg[2:0]salida_Memoria
);

always@(posedge clk)
begin
	salida_adder2 = adder2;
	salida_zero = zero;
	salida_Aluresult = Aluresult;
	salida_ReadData2 = ReadData2;
	salida_Mux = Mux;
	salida_WB = WB;
	salida_Memoria = Memoria;
end
endmodule