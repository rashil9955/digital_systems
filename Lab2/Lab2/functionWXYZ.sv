module functionWXYZ(
	input logic W,X,Y,Z,
	output logic F
);

logic notW, notX, notY, A1, A2, A3;

not(notW, W);
not(notX, X);
not(notY, Y);

and(A1, notW, notX, notY);

and(A2, notY, notX, W);

and(A3, notX, notW, Z);

or(F, A1, A2, A3);

endmodule