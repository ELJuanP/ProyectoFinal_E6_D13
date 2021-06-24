`timescale 1ns/1ns
module Unidad_Control(
    input [5:0]Opc,
    output reg MemToReg,
    output reg MemRead,
    output reg RegWrite,
    output reg MemToWrite,
    output reg RegDst,
    output reg branch,
    output reg ALUSrc,
    output reg[2:0]ALUOp,
    output reg Jump
);
always @* 
begin
    case (Opc)
    6'b000000:
    begin              //Intrucciones tipo R.
      MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 3'b001;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b1;
      branch = 1'b0;
      ALUSrc = 1'b0;
      Jump = 0;

    end
	
	//Addi.   //Instrucciones tipo I.
	6'b001000:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b0000;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//Ori.   //Instrucciones tipo I.
	6'b001101:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b0000;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//Andi.
	6'b001100:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b0011;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//LW
	6'b100011: //Opcode.
	begin
	  MemToReg = 1'b1;
      MemToWrite = 1'b0;
      ALUOp = 4'b0100;
      RegWrite = 1'b1;
      MemRead = 1'b1;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//SW
	6'b101011: //Opcode.
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b1;
      ALUOp = 4'b0101;
      RegWrite = 1'b0;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//Slti
	6'b001010:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b0110;
      RegWrite = 1'b1;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b0;
      ALUSrc = 1'b1;
      Jump = 0;
	end
	
	//beq
	6'b000100:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b0111;
      RegWrite = 1'b0;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b1;
      ALUSrc = 1'b0;
      Jump = 0;
	end
	
	//bne
	6'b000101:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b1000;
      RegWrite = 1'b0;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b1;
      ALUSrc = 1'b0;
      Jump = 0;
	end
	
	//bgtz
	6'b000111:
	begin
	  MemToReg = 1'b0;
      MemToWrite = 1'b0;
      ALUOp = 4'b1001;
      RegWrite = 1'b0;
      MemRead = 1'b0;
      RegDst = 1'b0;
      branch = 1'b1;
      ALUSrc = 1'b0;
      Jump = 0;
	end

  //Instrucciones tipo J
  6'b000010:
  begin
    MemToReg = 1'bx;
    ALUOp = 4'bx;
    RegWrite = 1'bx;
    MemRead = 1'bx;
    RegDst = 1'bx;
    branch = 1'bx;
    ALUSrc = 1'bx;
    Jump = 1;

  end
	
    default 
    begin
      MemToReg = 1'bx;
      MemToWrite = 1'bx;
      ALUOp = 3'bx;
      RegWrite = 1'bx;
      MemRead = 1'bx;
      RegDst = 1'bx;
      branch = 1'bx;
      ALUSrc = 1'bx;
      Jump = 0;
    end
    endcase
end
endmodule