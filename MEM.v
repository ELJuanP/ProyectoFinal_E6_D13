`timescale 1ns/1ns

module MEM(
	input Ewr,
	input [4:0]Dir,
	input [31:0]Din,
	output reg[31:0]Dout

);

reg [31:0]M[31:0];

always @* begin
M[Dir] <= Din;
if(Ewr == 1)
	begin
	Dout = M[Dir];
	end    
end
endmodule
