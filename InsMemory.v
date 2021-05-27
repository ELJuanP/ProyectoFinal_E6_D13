`timescale 1ns/1ns

module InsMemory(
	input [3:0]RA,
	output reg [31:0]INS
);
reg [7:0]IM[0:399];

initial
begin
$readmemb("TestF1_MemInst",IM);
end

assign //concatenar 
endmodule
