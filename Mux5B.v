`timescale 1ns/1ns

module Multiplexor5B(
    input [4:0]OP0,
    input [4:0]OP1,
    input Selector,
    output reg[4:0]Salida
);

always@*
begin
  case(Selector)
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

