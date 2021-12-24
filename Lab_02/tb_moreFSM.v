module tb_moreFSM();

// Inputs
reg inState;
reg clock;
reg reset;

// Outputs
wire outState;

// Circuit
moreFSM test (.reset(reset), .clk(clock), .inState(inState), .outState(outState));

initial begin
  clock = 0;
  forever #5 clock = ~clock;
end

initial begin
  inState = 0;
  reset = 1;
  #60;
  reset = 0;
  #20;
  inState = 1;
  reset = 1;
end
endmodule