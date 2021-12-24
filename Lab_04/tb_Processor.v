module tb_Processor();

// Input
reg [31:0] Inst;
reg clock;

// Outputs
wire [31:0] RD1, RD2, ALUresult, ReadData;
wire zeroFlag;

// Circuit
Processor test (.Inst(Inst), .CLK(clock), .RD1(RD1), .RD2(RD2), .ALUresult(ALUresult), .zeroFlag(zeroFlag), .ReadData(ReadData));

initial begin
  clock = 0;
  forever #5 clock = ~clock;
end

initial begin
  Inst = 32'b000100_00101_00100_00000_00000000000; //Thuc hien phep or
  #100;	
end

endmodule
