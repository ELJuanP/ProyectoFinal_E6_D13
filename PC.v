`timescale 1ns/1ns
module PC (
	input clk,
	input [3:0]A,
	output [3:0]B
);
	
always @(posedge clk)
begin
A = B;
end
endmodule
