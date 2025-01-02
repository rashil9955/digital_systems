module mult4 (
    input logic [3:0] A,       
    input logic [3:0] B,      
    output logic [7:0] P       
);

    logic [4:0] pp0, pp1, pp2, pp3;

    
    PP4 pp_stage0 (.A(A), .PPrev(4'b0000), .B(B[0]), .P(pp0));


    PP4 pp_stage1 (.A(A), .PPrev(pp0[4:1]), .B(B[1]), .P(pp1));


    PP4 pp_stage2 (.A(A), .PPrev(pp1[4:1]), .B(B[2]), .P(pp2));


    PP4 pp_stage3 (.A(A), .PPrev(pp2[4:1]), .B(B[3]), .P(pp3));


    assign P = {pp3, pp2[0], pp1[0], pp0[0]};

endmodule
