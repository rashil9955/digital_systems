 module adder4 (
    input logic [3:0] A,       
    input logic [3:0] B,       
    input logic Cin,           
    output logic [3:0] S,      
    output logic C4,           
    output logic V             
);

    logic C1, C2, C3; 

 
    fulladder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(C1));
    fulladder FA1 (.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .Cout(C2));
    fulladder FA2 (.A(A[2]), .B(B[2]), .Cin(C2), .S(S[2]), .Cout(C3));
    fulladder FA3 (.A(A[3]), .B(B[3]), .Cin(C3), .S(S[3]), .Cout(C4));


    assign V = C3 ^ C4;

endmodule
