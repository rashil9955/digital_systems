module sr_latch(
	input logic R, S,
	output logic Q, Qc
);

logic N1, N2;

assign N1 = R | Qc;
assign N2 = S | Q;

assign Q  = ~N1;
assign Qc = ~N2;

endmodule
