`timescale 1ns/1ns

module Buffer1(
	input clk,
	input[31:0]adder1,
	input[31:0]InsMemory,
	output reg[31:0]salida_adder1,
	output reg[31:0]salida_InsMemory
);

initial 
begin 
	salida_adder1 = 0;
	salida_InsMemory = 0;
end

 always@(posedge clk)
begin
	salida_adder1 = adder1;
	salida_InsMemory = InsMemory;
end
endmodule
