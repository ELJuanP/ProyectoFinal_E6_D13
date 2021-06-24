`timescale 1ns/1ns

module Buffer2(
	input clk,
	input[31:0] adder1,
	input[31:0] ReadData1,
	input[31:0] ReadData2,
	input[31:0] SignExtend,
	input[4:0] Instruccion1,
	input[4:0] Instruccion2,
	input MemToReg,
	input MemRead,
	input RegWrite,
	input MemToWrite,
	input RegDst,
	input branch,
	input ALUSrc,
	input[3:0]ALUOp,
	output reg[31:0]salida_adder1,
	output reg[31:0]salida_ReadData1,
	output reg[31:0]salida_ReadData2,
	output reg[31:0]salida_SignExtend,
	output reg[4:0]salida_Instruccion1,
	output reg[4:0]salida_Intreccion2,
	output reg[4:0]salida_EX,
	output reg[2:0]salida_Memoria,
	output reg[1:0]salida_WB
);

always@(posedge clk)
begin
   	salida_EX = {ALUSrc,ALUOp,RegDst};
	salida_Memoria = {branch, MemToWrite, MemRead};
	salida_WB = {MemToReg, RegWrite};
	salida_adder1 = adder1;
	salida_ReadData1 = ReadData1;
	salida_ReadData2 = ReadData2;
	salida_SignExtend = SignExtend;
	salida_Instruccion1 = Instruccion1;
	salida_Intreccion2 = Instruccion2;
end
endmodule