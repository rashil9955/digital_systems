module mult4 
(
    input logic [3:0] A,       // 4-bit multiplicand
    input logic [3:0] B,       // 4-bit multiplier
    output logic [7:0] P       // 8-bit product
);

    logic [4:0] pp0, pp1, pp2, pp3;

    // First partial product, no previous product to add, so PPrev is 0
    PP4 pp_stage0 (
        .A(A), 
        .PPrev(4'b0000), 
        .B(B[0]), 
        .P(pp0)
    );

    // Second partial product
    PP4 pp_stage1 (
        .A(A), 
        .PPrev(pp0[4:1]), 
        .B(B[1]), 
        .P(pp1)
    );

    // Third partial product
    PP4 pp_stage2 (
        .A(A), 
        .PPrev(pp1[4:1]), 
        .B(B[2]), 
        .P(pp2)
    );

    // Fourth partial product
    PP4 pp_stage3 (
        .A(A), 
        .PPrev(pp2[4:1]), 
        .B(B[3]), 
        .P(pp3)
    );

    // Concatenate the partial products to form the final 8-bit result
    assign P = {pp3, pp2[0], pp1[0], pp0[0]};

endmodule
