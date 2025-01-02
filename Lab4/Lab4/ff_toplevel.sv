module ff_toplevel(
    input logic CLK, J,CLK50M, K,
    output logic [1:0]LED
);

    logic debounced; 

    debouncer db(.A_noisy(CLK), .CLK50M(CLK50M), .A(debounced));
	 
	 jk_ff flop( .J(J), .K(K), .CLK(debounced), .Q(LED[0]), .Qc(LED[1]));

endmodule
