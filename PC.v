`timescale 1ns/1ns

module PC(
    input clk,
    input [31:0]Entrada,
    output reg [31:0]Salida


);
initial begin
    Salida = 32'h00000000;
end

always@(posedge clk)
begin
    Salida = Entrada;
end

endmodule
