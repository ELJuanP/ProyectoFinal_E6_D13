`timescale 1ns/1ns
module BancoReg(
	input [4:0]RA1,
	input [4:0]RA2,
	input [31:0]Di,
	input [4:0]AW,
	input RW,
	output reg[31:0]DR1,
	output reg[31:0]DR2

);

reg [31:0]BR[0:31];

initial 
begin $readmemb("TestF1_BReg",BR);
#100;
end

always @* begin
if(RW == 1)
	begin
	BR[AW] <= Di;
	end    
DR1 <= BR[RA1];
DR2 <= BR[RA2];
end

endmodule
