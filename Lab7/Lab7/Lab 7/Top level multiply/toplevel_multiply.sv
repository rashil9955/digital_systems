module toplevel_multiply (
    input logic [3:0] A,           // 4-bit multiplicand
    input logic [3:0] B,           // 4-bit multiplier
    output logic [6:0] segA,       // 7-segment output for A
    output logic [6:0] segB,       // 7-segment output for B
    output logic [6:0] segP1,      // 7-segment output for lower digit of P
    output logic [6:0] segP2       // 7-segment output for upper digit of P
);

    // Declare internal signals
    logic [7:0] P;                 // 8-bit product output from mult4

    // 4-bit multiplier
    mult4 multiplier (
        .A(A),
        .B(B),
        .P(P)
    );

    // hex decoder for A
    decimal7decoderLab7 decoderA (
        .b_in(A),
        .digit_out(segA)   // Connect to 7-segment display for A
    );

    // hex decoder for B
    decimal7decoderLab7 decoderB (
        .b_in(B),
        .digit_out(segB)   // Connect to 7-segment display for B
    );

    //  hex decoder for lower 4 bits of P (P[3:0])
    decimal7decoderLab7 decoderP1 (
        .b_in(P[3:0]),
        .digit_out(segP1)  // Connect to 7-segment display for lower P
    );

    // hex decoder for upper 4 bits of P (P[7:4])
    decimal7decoderLab7 decoderP2 (
        .b_in(P[7:4]),
        .digit_out(segP2)  // Connect to 7-segment display for upper P
    );

endmodule
