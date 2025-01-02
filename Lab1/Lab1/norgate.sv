module lab11(
  input logic A,B,
  output logic Y,Z
);
  logic notA, notB, nontY;
  
  and(notY,A,B);
  
  not(Y, notY);
  
  
  not(notA, A);
  not(notB, B);

  
  or(Z, notA, notB);

endmodule
