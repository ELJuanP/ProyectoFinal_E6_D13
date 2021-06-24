`timescale 1ns/1ns

module DPTR(
	input clk              
);
 wire[31:0]ToPc,ToAdd1_INS,ExitAdd1,Instruction0,ExitBuffer1,ExitBufer1ToBR,ExitReadData1,ExitReadData2,ExitSignExtend,ExitToBuff2toAdder2,SFbToAdderB,ExitBuffer2ToAlu,Buffer2ToMuxToBuff3,ExitMuxToAlu,ExitBuff2ToAluC,ExitAdder2Tobuuf3,AluResToBuffer3,ExitBuffer3ToMux3,ExitBuffer3ToAddres,ExitBuffer3ToWriteD,ExitReadDataToBuffer4,ExitBuffer4ToMux2,ExitBuffer4ToMux2_OP1,ExitMux2ToBR,JumpAdressToMux,Mux4ToMux3;
 wire[4:0]UCtoEX;
 wire flagToBuffer3,ExitBuffer3ToAndF,ExitAndToMux3,UCToMux;
 wire[4:0]ExitBuff2ToMux_5,ExitBuff2ToMux_5_OP1,ExitMux_5ToBuffer3,ExitBuffer3ToBuffer4,ExitBuffer4ToBR;
 wire MemToReg, MemRead,RegWrite, MemToWrite, RegDst, branch, ALUSrc;
 wire[2:0]UCtoM,UCtoM_1,UCtoM_2,UCtoM_3,ALUOp;
 wire[1:0]WB,UCtoWB,UCtoWB_1,UCtoWB_2;
 wire[3:0]AluCToAlu;
 wire[0:25]InsMemoryToSL2;

Multiplexor Mux3(
	.OP0(Mux4ToMux3),
	.OP1(ExitAndToMux3),
	.Dec(UCtoMux),
	.Salida(ToPc)
);

PC PC(
	.Entrada(ToPc),
	.clk(clk),
	.Salida(ToAdd1_INS)
);

Adder1 Adder1(
	.A(ToAdd1_INS),
	.B(ExitAdd1)
);

Instruction_Memory Instruction_Memory(
	.Dir(ToAdd1_INS),
	.Instruction(Instruction0)
);

Buffer1 Buffer1(
	.adder1(ExitAdd1),
	.InsMemory(Instruction0),
	.clk(clk),
	.salida_adder1(ExitBuffer1),
	.salida_InsMemory(ExitBufer1ToBR)
);

////////////////////////////////////

Banco_Registros Banco_Registros(
	.ReadRegister1(ExitBufer1ToBR[25:21]),
    .ReadRegister2(ExitBufer1ToBR[20:16]),
    .WriteData(ExitMux2ToBR),
    .WriteRegister(ExitBuffer4ToBR),
	.RegWrite(UCtoWB_2[0]),
    .ReadData1(ExitReadData1),
    .ReadData2(ExitReadData2)
);


Unidad_Control Unidad_Control(
	.Opc(ExitBufer1ToBR[31:26]),
	.MemToReg(MemToReg),
	.MemRead(MemRead),
    .RegWrite(RegWrite),
    .MemToWrite(MemToWrite),
    .RegDst(RegDst),
    .branch(branch),
    .ALUSrc(ALUSrc),
    .ALUOp(ALUOp)
);

SignExtend SignExtend(
	.SignInput(ExitBufer1ToBR[15:0]),
	.Extend(ExitSignExtend)
);

Buffer2 Buffer2(
	.clk(clk),
	.adder1(ExitBuffer1),
	.ReadData1(ExitReadData1),
	.ReadData2(ExitReadData2),
	.SignExtend(ExitSignExtend),
	.Instruccion1(ExitBufer1ToBR[20:16]),
	.Instruccion2(ExitBufer1ToBR[15:11]),
	.MemToReg(MemToReg),
	.MemRead(MemRead),
    .RegWrite(RegWrite),
    .MemToWrite(MemToWrite),
    .RegDst(RegDst),
    .branch(branch),
    .ALUSrc(ALUSrc),
    .ALUOp({0,ALUOp}),
	.salida_adder1(ExitToBuff2toAdder2),
	.salida_ReadData1(ExitBuffer2ToAlu),
	.salida_ReadData2(Buffer2ToMuxToBuff3),
	.salida_SignExtend(ExitBuff2ToAluC),
	.salida_Instruccion1(ExitBuff2ToMux_5),
	.salida_Intreccion2(ExitBuff2ToMux_5_OP1),
	.salida_EX(UCtoEX),
	.salida_Memoria(UCtoM),
	.salida_WB(UCtoWB)
);
//////////////////////////////////////////
ShiftLeft ShiftLeft(
	.A(ExitBuff2ToAluC),
	.B(SFbToAdderB)
);
Multiplexor Mux1(
	.OP0(Buffer2ToMuxToBuff3),
	.OP1(ExitBuff2ToAluC),
	.Dec(UCtoEX[4]),
	.Salida(ExitMuxToAlu)
);

Multiplexor5B Multiplexor5B(   
	.OP0(ExitBuff2ToMux_5),
	.OP1(ExitBuff2ToMux_5_OP1),
	.Selector(UCtoEX[0]),
	.Salida(ExitMux_5ToBuffer3)
);
Sumador Sumador2(       //Adder2
	.A(ExitToBuff2toAdder2),
	.B(SFbToAdderB),
	.C(ExitAdder2Tobuuf3)
);


ALUCONTROL ALUCONTROL(  
	.Instruction(ExitBuff2ToAluC[5:0]),
	.ALUOp({0,UCtoEX[3:1]}),
	.OutAlu(AluCToAlu)
);

ALU ALU(
	.EA(Buffer2ToMuxToBuff3),
	.EB(ExitMuxToAlu),
	.sel(AluCToAlu),
	.res(AluResToBuffer3),
	.flag(flagToBuffer3)
);

Buffer3 Buffer3(
	.clk(clk),
	.adder2(ExitAdder2Tobuuf3),
	.zero(flagToBuffer3),
	.Aluresult(AluResToBuffer3),
	.ReadData2(Buffer2ToMuxToBuff3),
	.Mux(ExitMux_5ToBuffer3),
	.WB(UCtoWB),
	.Memoria(UCtoM),
	.salida_adder2(ExitBuffer3ToMux3),
	.salida_zero(ExitBuffer3ToAndF),
	.salida_Aluresult(ExitBuffer3ToAddres),
	.salida_ReadData2(ExitBuffer3ToWriteD),
	.salida_Mux(ExitBuffer3ToBuffer4),
	.salida_WB(UCtoWB_1),
	.salida_Memoria(UCtoM_1)
);
/////////////////////////////////////////////////////

Memoria Memoria(
	.MemRead(UCtoM_1[1]), 
    .Adress(ExitBuffer3ToAddres),
    .WriteData(ExitBuffer3ToWriteD), 
    .ReadData(ExitReadDataToBuffer4) 
);

And And(
	.A(UCtoM_1[0]),
	.B(ExitBuffer3ToAndF),
	.C(ExitAndToMux3)
);

Buffer4 Buffer4(
	.clk(clk),
	.ReadData(ExitReadDataToBuffer4),
	.WB(UCtoWB_1),
	.AluResult(ExitBuffer3ToWriteD),
	.Mux(ExitBuffer3ToBuffer4),
	.salida_ReadData(ExitBuffer4ToMux2),
	.salida_WB(UCtoWB_2),
	.salida_AluResult(ExitBuffer4ToMux2_OP1),
	.salida_Mux(ExitBuffer4ToBR) 
); 
////////////////////////////////////
Multiplexor Mux2(
	.OP0(ExitBuffer4ToMux2),
	.OP1(ExitBuffer4ToMux2_OP1),
	.Dec(UCtoWB_2[1]),
	.Salida(ExitMux2ToBR)
);
///////////////////////////////////
ShiftLeft_New ShiftLeft_2(
	.A(InsMemoryToSL2),
	.B(JumpAdressToMux)
);
Multiplexor Mux4(
	.OP0(ExitAdd1),
	.OP1(ExitAdder2Tobuuf3),
	.Dec(ExitAndToMux3),
	.Salida(Mux4ToMux3)
);

endmodule