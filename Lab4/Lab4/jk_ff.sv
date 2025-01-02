module jk_ff(
	input logic J, K, CLK, 
	output logic Q, Qc
);

logic Kc;

assign Kc = ~K;


logic A1, A2, O1;



assign A1 = J & Qc;
assign A2 = Kc & Q;

assign O1 = A1 | A2;



d_ff lat( .D(O1), .CLK(CLK), .Q(Q), .Qc(Qc));

endmodule