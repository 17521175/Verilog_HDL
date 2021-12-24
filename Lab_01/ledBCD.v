module ledBCD (inLed, outD1, outD0);

// Internal constants
parameter numBitIn = 3;
parameter numBitOut = 6;

// IO port declare
input [numBitIn:0] inLed;
output [numBitOut:0] outD1, outD0;

// Internal net
wire [3:0] m;
wire z;
wire [2:0] outCir;

// Circuit
comparator4bit comp (.inCompa(inLed), .outCompa(z));
circuitA3bit A (.inA(inLed[2:0]), .outA(outCir));
mux2to1 mux0 (.in0(inLed[0]), .in1(outCir[0]), .sel(z), .out(m[0]));
mux2to1 mux1 (.in0(inLed[1]), .in1(outCir[1]), .sel(z), .out(m[1]));
mux2to1 mux2 (.in0(inLed[2]), .in1(outCir[2]), .sel(z), .out(m[2]));
mux2to1 mux3 (.in0(inLed[3]), .in1(0), .sel(z), .out(m[3]));
circuitB B (.inB(z), .outB(outD1));
decoder4bit decoder (.inDe(m), .outDe(outD0));

endmodule
