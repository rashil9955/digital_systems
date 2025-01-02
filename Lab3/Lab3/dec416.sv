module dec416 (
   input logic [3:0]A,
	input logic en,
	output logic[15:0]Y
);
	
	assign Y[0]= (~A[3] & ~A[2] & ~A[1] & ~A[0])&en; 
	assign Y[1] = (~A[3] & ~A[2] & ~A[1] & A[0])&en; 
	assign Y[2]= (~A[3] & ~A[2] & A[1] & ~A[0])&en; 
	assign Y[3]= (~A[3] & ~A[2] & A[1] & A[0])&en; 
	assign Y[4]= (~A[3] & A[2] & ~A[1] & ~A[0])&en; 
	assign Y[5]= (~A[3] & A[2] & ~A[1] & A[0])&en; 
	assign Y[6]= (~A[3] & A[2] & A[1] & ~A[0])&en; 
	assign Y[7]= (~A[3] & A[2] & A[1] & A[0])&en; 
	assign Y[8]= (A[3] & ~A[2] & ~A[1] & ~A[0])&en; 
	assign Y[9]= (A[3] & ~A[2] & ~A[1] & A[0])&en;
	assign Y[10]= (A[3] & ~A[2] & A[1] & ~A[0])&en;
	assign Y[11]= (A[3] & ~A[2] & A[1] & A[0])&en;
	assign Y[12]= (A[3] & A[2] & ~A[1] & ~A[0])&en;
	assign Y[13]= (A[3] & A[2] & ~A[1] & A[0])&en;
	assign Y[14]= (A[3] & A[2] & A[1] & ~A[0])&en;
	assign Y[15]= (A[3] & A[2] & A[1] & A[0])&en;
	
endmodule