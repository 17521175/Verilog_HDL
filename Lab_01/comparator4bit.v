module comparator4bit(inCompa, outCompa);

// Internal constants
parameter numBit = 3;

// IO port declare
input [numBit:0] inCompa;
output outCompa;

// Circuit
assign outCompa = (inCompa > 9) ? 1 : 0;

endmodule