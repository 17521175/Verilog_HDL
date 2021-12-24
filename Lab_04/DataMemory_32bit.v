module DataMemory_32bit (Addr, WD, MemWrite, MemRead, CLK, RD);

// Internal constants
parameter numBit = 31;

// IO port declare
input [numBit:0] Addr, WD;
input MemWrite, MemRead, CLK;
output [numBit:0] RD;

// Output data type
reg [numBit:0] RD;

// Internal variables
reg [numBit:0] memCell [0:numBit];

// Circuit
always @ (posedge CLK) begin
  if(MemWrite == 1) begin
    memCell[Addr] <= WD;
  end
end

always @ (posedge CLK) begin
  if(MemRead == 1) begin
    RD <= memCell[Addr];
  end
end

endmodule