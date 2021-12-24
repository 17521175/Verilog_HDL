module circuitA3bit (inA, outA);

// Internal constants
parameter numBit = 2;

// IO port declare
input [numBit:0] inA;
output [numBit:0] outA;

// Circuit
assign outA = inA - 2;

endmodule
