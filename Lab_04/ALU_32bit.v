module ALU_32bit (inA, inB, ALUcontrol, zeroFlag, outY);

// Internal constants
parameter numBit = 31;
parameter numBitControl = 1;

// IO port declare
input [numBit:0] inA, inB;
input [numBitControl:0] ALUcontrol;
output [numBit:0] outY;
output zeroFlag;

// Output data type
reg [numBit:0] outY;
reg zeroFlag;

// Circuit
always @ (*) begin
	case(ALUcontrol)
		2'b00: outY = ~inA;
		2'b01: outY = inA & inB;
		2'b10: outY = inA ^ inB;
		2'b11: outY = inA | inB;
		default: outY = ~inA;
	endcase
end
always @ (*) begin
	if(outY == 0) begin
		zeroFlag = 1;
	end
	else begin
		zeroFlag = 0;
	end
end

endmodule

