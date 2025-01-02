module seven_seg(
	input logic[3:0] SW,
	input logic En,
	output logic [15:0] z,
	output logic W,
	output logic [6:0] led
);

dec416 dec(.A(SW), .en(En), .Y(z));

	assign led[0] = ~(z[0] |        z[2] | z[3] |        z[5] | z[6] | z[7] | z[8] | z[9] | z[10] |         z[12] |        z[14] | z[15]);
	assign led[1] = ~(z[0] | z[1] | z[2] | z[3] | z[4] |               z[7] | z[8] | z[9] | z[10] |                 z[13]);
	assign led[2] = ~(z[0] | z[1] |        z[3] | z[4] | z[5] | z[6] | z[7] | z[8] | z[9] | z[10] | z[11] |         z[13]);
	assign led[3] = ~(z[0] |        z[2] | z[3] |        z[5] | z[6] |        z[8] | z[9] |         z[11] | z[12] | z[13] | z[14] );	
	assign led[4] = ~(z[0] |        z[2] |                      z[6] |	     z[8] | z[10]|         z[11] | z[12] | z[13] | z[14] | z[15]);	
	assign led[5] = ~(z[0] |                      z[4] | z[5] | z[6] |        z[8] | z[9] | z[10] | z[11] | z[12] |         z[14] | z[15]);	
	assign led[6] = ~(              z[2] | z[3] | z[4] | z[5] | z[6] |        z[8] | z[9] | z[10] | z[11] |         z[13] | z[14] | z[15]);	
	
	assign A = ~En;
	
endmodule