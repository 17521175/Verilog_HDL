module moreFSM(reset, clk, inState, outState);

// IO Ports decalre
input inState, reset, clk;
output outState;

// Output Data type
reg outState;

// Internal constants
parameter numBit = 3;
parameter stateA = 4'b0000, stateB = 4'b0001, stateC = 4'b0010, stateD = 4'b0011, stateE = 4'b0100, stateF = 4'b0101, stateG = 4'b0110, stateH = 4'b0111, stateI = 4'b1000;

// Internal variables
reg [numBit:0] state;

// Circuit
always @ (posedge clk or negedge reset) begin
	if(reset == 0) begin
		state <= stateA;
		outState <= 0;
	end
	else begin
		case(state)
			stateA: begin outState <= 0; if(inState == 0) state <= stateB; else state <= stateF; end
			stateB: begin outState <= 0; if(inState == 0) state <= stateC; else state <= stateF; end
			stateC: begin outState <= 0; if(inState == 0) state <= stateD; else state <= stateF; end
			stateD: begin outState <= 0; if(inState == 0) state <= stateE; else state <= stateF; end
			stateE: begin outState <= 1; if(inState == 0) state <= stateE; else state <= stateF; end
			stateF: begin outState <= 0; if(inState == 1) state <= stateG; else state <= stateB; end
			stateG: begin outState <= 0; if(inState == 1) state <= stateH; else state <= stateB; end
			stateH: begin outState <= 0; if(inState == 1) state <= stateI; else state <= stateB; end
			stateI: begin outState <= 1; if(inState == 1) state <= stateI; else state <= stateB; end
			default: state = stateA;
		endcase 
	end
end
endmodule
