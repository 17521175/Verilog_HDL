module Registers_32bit (RR1, RR2, WR, WD, RegWrite, CLK, RD1, RD2);

// Internal constants
parameter numBitRR = 4;
parameter numBit = 31;

// IO port declare
input [numBitRR:0] RR1, RR2, WR;
input [numBit:0] WD;
input RegWrite, CLK;
output [numBit:0] RD1, RD2;

// Output data type
reg [numBit:0] RD1, RD2;

// Internal variables
reg [numBit:0] regCell [0:numBit];

// Circuit
always @ (posedge CLK) begin
  if(RegWrite == 1) begin
    regCell[WR] <= WD;
  end
end

always @ (posedge CLK) begin
  RD1 <= regCell[RR1];
  RD2 <= regCell[RR2];
end

endmodule