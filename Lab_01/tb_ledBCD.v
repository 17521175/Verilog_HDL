module tb_ledBCD();

// Internal constants
parameter numBitIn = 3;
parameter numBitOut = 6;

// Inputs
reg [numBitIn:0] inLed;

// Outputs
wire [numBitOut:0] outD1, outD0;

// Circuit

ledBCD test (.inLed(inLed), .outD1(outD1), .outD0(outD0));

initial begin
  inLed = 1;
  #10;
  inLed = 2;
  #10;
  inLed = 9;
  #10;
  inLed = 10;
  #10;
  inLed = 14;
  #10;
end
endmodule