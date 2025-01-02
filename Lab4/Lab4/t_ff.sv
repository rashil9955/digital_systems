module t_ff(
	input logic CLK, T,
	output logic Q, Qc
);

logic Tc, A1, A2, O1;

assign Tc = ~T;

assign A1 = Tc & Q;
assign A2 = T & Qc;

assign O1 = A1 | A2;

d_ff latch1( .D(O1), .CLK(CLK), .Q(Q), .Qc(Qc));

endmodule