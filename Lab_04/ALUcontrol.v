module ALUcontrol (ALUOp, ALUctrl);

// Internal constants
parameter numBit = 1;

// IO port declare
input [numBit:0] ALUOp;
output [numBit:0] ALUctrl;

// Output data type
reg [numBit:0] ALUctrl;

// Circuit
always @ (ALUOp) begin
  case(ALUOp)
    2'b00: ALUctrl <= 2'b00;
    2'b01: ALUctrl <= 2'b01;
    2'b10: ALUctrl <= 2'b10;
    2'b11: ALUctrl <= 2'b11;
    default: ALUctrl <= 2'bxx;
  endcase
end

endmodule