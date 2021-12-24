module tb_traffLight();

// Internal constants
parameter numBit = 2;

// Inputs
reg reset, clock;

// Outputs
wire [numBit:0] NS, EW;

// Circuit
traffLight test (.reset(reset), .clk(clock), .northSouth(NS), .eastWest(EW));

initial begin
  clock = 0;
  forever #5 clock = ~clock;
end

initial begin
  reset = 1;
  #2000;
  reset = 0;
  #20;
end
endmodule
