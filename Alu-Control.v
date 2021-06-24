`timescale 1ns/1ns
module ALUCONTROL(
    input [5:0] Instruction,
    input [3:0] ALUOp,
    output reg[3:0] OutAlu
);
always @* 
begin
    if (ALUOp == 4'b0001)
    begin
      case (Instruction)
          6'b100000:
          begin
            OutAlu = 4'd0;
          end
          6'b100010:
          begin
            OutAlu = 4'd1;
          end
          6'b100100:
          begin
            OutAlu = 4'd2;
          end
          6'b100101:
          begin
            OutAlu = 4'd3;
          end
          6'b101010:
          begin
            OutAlu = 4'd4;
          end
      6'b000000:
          begin
            OutAlu = 4'd5;
          end
      6'b011000:
          begin
            OutAlu = 4'd6;
          end
      6'b011010:
          begin
            OutAlu = 4'd7;
          end
        6'b000010: //Mismo que tipo J
        begin
            OutAlu = 4'dx;
        end
        endcase
    end
	
	//Addi.
	if (ALUOp == 4'b0000)
	begin
	 OutAlu = 4'd0;
	end
	
	//Ori.
	if (ALUOp == 4'b0010) 
	begin
	 OutAlu = 4'd3;
	end
	
	//Andi
	if (ALUOp == 4'b0011) 
	begin
	 OutAlu = 4'd2;
	end
	
	//LW
	if (ALUOp == 4'b0100) 
	begin
	 OutAlu = 4'd0;
	end
	
	//SW
	if (ALUOp == 4'b0101) 
	begin
	 OutAlu = 4'd0;
	end
	
	//Slti
	if (ALUOp == 4'b0110) 
	begin
	 OutAlu = 4'd4;
	end
	
	//beq
	if (ALUOp == 4'b0111) 
	begin
	 OutAlu = 4'd1;
	end
	
	//bne
	if (ALUOp == 4'b1000) 
	begin
	 OutAlu = 4'd8;
	end
	
	//bgtz
	if (ALUOp == 4'b1001) 
	begin
	 OutAlu = 4'd9;
	end
	//Jump
	if(ALUOp == 4'bx)
	begin
	  OutAlu = 4'dx;
	end

end
endmodule