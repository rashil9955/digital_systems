module d_ff(
	input logic CLK, D,
	output logic Q, Qc
);

logic CLKc, N1;

assign CLKc = ~CLK;

d_latch latch1(.D(D), .CLK(~CLK), .Q(N1), .Qc());

d_latch latch2(.D(N1), .CLK(CLK), .Q(Q), .Qc(Qc));

endmodule