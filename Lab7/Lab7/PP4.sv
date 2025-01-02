module PP4 
(
    input logic [3:0] A,      
    input logic [3:0] PPrev,  
    input logic B,           
    output logic [4:0] P     
);
    
    logic [3:0] Ain;
    assign Ain = A & {4{B}};
    
    logic C4, V;
   
    adder4 fa0 (.A(Ain),.B(PPrev),.Cin(1'b0),.S(P[3:0]),.C4(C4),.V(V));
    
    assign P[4] = C4;

endmodule
