module ControlUnit (Inst, RegDst, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite);

// Internal constants
parameter numBit = 5;
parameter numBitALU = 1;

// IO port declare
input [numBit:0] Inst;
output RegDst, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite;
output [numBitALU:0] ALUOp;

// Output data type
reg RegDst, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite;
reg [numBitALU:0] ALUOp;

// Circuit
always @ (Inst) begin
  case(Inst)
    6'b000001: begin               // Not
                  RegDst <= 1'b1;
                  MemRead <= 1'b1;
                  MemWrite <= 1'b0;
                  MemToReg <= 1'b1;
                  ALUOp <= 2'b00;
                  ALUSrc <= 1'b0;
                  RegWrite <= 1'b1;   
                end
    6'b000010: begin               // And
                  RegDst <= 1'b1;
                  MemRead <= 1'b1;
                  MemWrite <= 1'b0;
                  MemToReg <= 1'b1;
                  ALUOp <= 2'b01;
                  ALUSrc <= 1'b0;
                  RegWrite <= 1'b1;   
                end
    6'b000100: begin               //Or
                  RegDst <= 1'b1;
                  MemRead <= 1'b1;
                  MemWrite <= 1'b0;
                  MemToReg <= 1'b1;
                  ALUOp <= 2'b10;
                  ALUSrc <= 1'b0;
                  RegWrite <= 1'b1;   
                end
    6'b001000: begin               //Xor
                  RegDst <= 1'b1;
                  MemRead <= 1'b1;
                  MemWrite <= 1'b0;
                  MemToReg <= 1'b1;
                  ALUOp <= 2'b11;
                  ALUSrc <= 1'b0;
                  RegWrite <= 1'b1;   
                end
    default: begin
                  RegDst <= 1'b0;
                  MemRead <= 1'b0;
                  MemWrite <= 1'b0;
                  MemToReg <= 1'b0;
                  ALUOp <= 2'b00;
                  ALUSrc <= 1'b0;
                  RegWrite <= 1'b0;   
              end
  endcase
end
endmodule