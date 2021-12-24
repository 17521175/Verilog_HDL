module mux2to1 (in0, in1, sel, out);

// IO port declare
input in0, in1, sel;
output out;

// Circuit
assign out = (sel) ? in1 : in0;

endmodule
