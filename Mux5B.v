`timescale 1ns/1ns

module Mux5B(
    input [31:0]OP0,
    input [31:0]OP1,
    input Dec,
    output reg[31:0]Salida
);

always@*
begin
  case(Dec)
    1'b0:
    begin
      Salida <= OP0;
    end

    1'b1:
    begin
      Salida <= OP1;
    end    
  endcase
end
endmodule

