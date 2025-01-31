module d_latch(
	input logic D, CLK,
	output logic Q, Qc
);

logic Dc, A1, A2;

assign Dc = ~D;

assign A1 = Dc & CLK;
assign A2 = CLK & D;

sr_latch latch1(.R(A1), .S(A2), .Q(Q), .Qc(Qc));

endmodule

