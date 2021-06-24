`timescale 1ns/1ns

module Buffer4(
	input clk,
	input[31:0]ReadData,
	input[1:0]WB,
	input[31:0]AluResult,
	input[4:0] Mux,
	output reg[31:0]salida_ReadData,
	output reg[1:0]salida_WB,
	output reg[31:0]salida_AluResult,
	output reg[4:0]salida_Mux 
);

initial
begin
	salida_ReadData = 0;
	salida_WB = 0;
	salida_AluResult = 0;
	salida_Mux = 0;
end


always@(posedge clk)
begin
	salida_ReadData = ReadData;
	salida_WB = WB;
	salida_AluResult = AluResult;
	salida_Mux = Mux;
end
endmodule