module Processor (Inst, CLK, RD1, RD2, ALUresult, zeroFlag, ReadData);

// IO port declare
input [31:0] Inst;
input CLK;
output [31:0] RD1, RD2, ALUresult, ReadData;
output zeroFlag;

// Internal nets
wire RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg;
wire [4:0] outMux1;
wire [31:0] RD1, RD2;
wire [31:0] outSign;
wire [31:0] outMux2;
wire zeroFlag;
wire [31:0] ALUresult;
wire [31:0] ReadData;
wire [31:0] outMux3;
wire [1:0] ALUctrl;
wire [1:0] ALUOp;


// Ciruit
// Mux 1
mux2to1_5bit mux1 (.in0(Inst[15:11]), .in1(Inst[20:16]), .sel(RegDst), .outY(outMux1));

// Registers
Registers_32bit registers (.RR1(Inst[25:21]), .RR2(Inst[20:16]), .WR(outMux1), .WD(outMux3), .RegWrite(RegWrite), .CLK(CLK), .RD1(RD1), .RD2(RD2));

// Sign Extend
SignExtend_32bit signex (.inSign(Inst[15:0]), .outSign(outSign));

// Mux 2
mux2to1_32bit mux2 (.in0(outSign), .in1(RD2), .sel(ALUSrc), .outY(outMux2));

// ALU Unit
ALU_32bit alu (.inA(RD1), .inB(outMux2), .ALUcontrol(ALUctrl), .zeroFlag(zeroFlag), .outY(ALUresult));

// Data Memory
DataMemory_32bit datamem (.Addr(ALUresult), .WD(RD2), .MemWrite(MemWrite), .MemRead(MemRead), .CLK(CLK), .RD(ReadData));

// Mux3
mux2to1_32bit mux3 (.in0(ALUresult), .in1(ReadData), .sel(MemToReg), .outY(outMux3));

// Control Unit
ControlUnit controller (.Inst(Inst[31:26]), .RegDst(RegDst), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg(MemToReg), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .RegWrite(RegWrite));

// ALU Control
ALUcontrol aluctrl (.ALUOp(ALUOp), .ALUctrl(ALUctrl));

endmodule
