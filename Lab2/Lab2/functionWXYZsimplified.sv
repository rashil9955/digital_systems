module functionWXYZsimplified(
	input logic W,X,Y,Z,
	output logic F
);

logic notW, notX, notY, A1, A2, A3;

not(notW, W);
not(notX, X);
not(notY, Y);

and(A1, notW, Z);

or(O1, A1, notY);

and(F, notX, O1);

endmodule