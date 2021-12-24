module SignExtend_32bit (inSign, outSign);

// Internal constants
parameter numBitIn = 15;
parameter numBitOut = 31;

// IO port declare
input [numBitIn:0] inSign;
output [numBitOut:0] outSign;

// Circuit
assign outSign = {{16{inSign[15]}},inSign};

endmodule


