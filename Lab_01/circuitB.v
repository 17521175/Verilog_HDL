module circuitB (inB, outB);

// Internal constants
parameter numBit = 6;

// IO port declare
input inB;
output reg [6:0] outB;

// Circuit
always @ (inB) begin
    case (inB)
      0 : outB = 7'b0000001; //0
      1 : outB = 7'b1001111; //1
      default : outB = 7'b1111111;
    endcase
end

endmodule
