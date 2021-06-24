`timescale 1ns/1ns
module Banco_Registros(
    input [4:0]ReadRegister1,
    input [4:0]ReadRegister2,
    input [31:0]WriteData,
    input [4:0]WriteRegister,
    input RegWrite,
    output reg[31:0]ReadData1,
    output reg[31:0]ReadData2
);
reg [31:0] BRM [0:31];
initial begin
    $readmemb("Banco.mem",BRM);

end
always @*
begin
    ReadData1 = BRM[ReadRegister1];
    ReadData2 = BRM[ReadRegister2];
    if (RegWrite)
    begin
        BRM[WriteRegister] <= WriteData;
    end

end
endmodule
