module norgate(
  input logic A,B,
  output logic Y,Z
);
  logic notA, notB;
  nand(Y,A,B);
  
  not(notA,A);
  not(notB, B);
  
  or(Z, notA, notB);
endmodule
