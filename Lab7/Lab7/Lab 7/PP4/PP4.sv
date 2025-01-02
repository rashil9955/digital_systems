module PP4 
(
    input logic [3:0] A,      // Multiplicand
    input logic [3:0] PPrev,  // Previous partial product or accumulated value
    input logic B,            // Current bit of the multiplier
    output logic [4:0] P      // Output partial product with carry-out
);

    
    logic [3:0] Ain;
    assign Ain = A & {4{B}};
    
    // Carry-out and overflow signals
    logic C4, V;
    
    //  4-bit adder (adder4) to add Ain and PPrev
    adder4 fa0 (
        .A(Ain), 
        .B(PPrev), 
        .Cin(1'b0), 
        .S(P[3:0]), 
        .C4(C4), 
        .V(V)
    );
    
    // Assign the carry-out to the fifth bit of P
    assign P[4] = C4;

endmodule
