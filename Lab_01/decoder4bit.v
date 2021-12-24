module decoder4bit (inDe, outDe);

// Internal constants
parameter numBitIn = 3;
parameter numBitOut = 6;

// IO port declare
input [numBitIn:0] inDe;
output reg [numBitOut:0] outDe;

// Circuit
always @ (inDe) begin
  case (inDe)
    0 : outDe = 7'b0000001;
    1 : outDe = 7'b1001111;
    2 : outDe = 7'b0010010;
    3 : outDe = 7'b0000110;
    4 : outDe = 7'b1001100;
    5 : outDe = 7'b0100100;
    6 : outDe = 7'b0100000;
    7 : outDe = 7'b0001111;
    8 : outDe = 7'b0000000;
    9 : outDe = 7'b0000100;
    default : outDe = 7'b1111111;
  endcase
end

endmodule 
