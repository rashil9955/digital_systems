module text_decode(
	input logic [3:0]P,
	input logic enable,
	output logic [15:0]K,
	output logic Y

);



	dec416(.A(P), .en(enable), .Y(K));

endmodule