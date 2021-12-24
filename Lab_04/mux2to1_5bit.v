module mux2to1_5bit (in0, in1, sel, outY);

// Internal constants
parameter numBit = 4;

// IO port declare
input [numBit:0] in0, in1;
input sel;
output [numBit:0] outY;

// Circuit
assign outY = (sel)?in1:in0;

endmodule

