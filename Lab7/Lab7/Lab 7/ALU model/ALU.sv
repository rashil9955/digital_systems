module ALU#(
    parameter N = 8
)
(
    input  logic [N-1:0] A, B,
    input  logic [1:0] ALUControl,
    output logic [N-1:0] Result,
    output logic V, C, Neg, Z // Flags for overflow, carry, negative, and zero
);

    // set parameter for the functions
    localparam ADD = 2'b00;
    localparam SUB = 2'b01;
    localparam AND = 2'b10;
    localparam OR  = 2'b11;

    logic Cin;
    logic [N-1:0] B_true;      // Modified B for sub
    logic [N-1:0] temp_result; // Temporary result
    logic [N-1:0] Cout;        // Carry out

  
    // Set Cin for addition or subtraction
    always_comb begin
        if (ALUControl == SUB) begin
            Cin = 1'b1; 
        end else begin
            Cin = 1'b0; 
        end
    end

    // Prepare B for the operation based on Cin 
    assign B_true = B ^ {N{Cin}}; // If Cin is 1, B inverts

    // Full adder structure for addition/subtraction
    fulladder fa0   (.A(A[0]), .B(B_true[0]), .Cin(Cin),    .S(temp_result[0]), .Cout(Cout[0]));
    fulladder fa1   (.A(A[1]), .B(B_true[1]), .Cin(Cout[0]), .S(temp_result[1]), .Cout(Cout[1]));
    fulladder fa2   (.A(A[2]), .B(B_true[2]), .Cin(Cout[1]), .S(temp_result[2]), .Cout(Cout[2]));
    fulladder fa3   (.A(A[3]), .B(B_true[3]), .Cin(Cout[2]), .S(temp_result[3]), .Cout(Cout[3]));
    fulladder fa4   (.A(A[4]), .B(B_true[4]), .Cin(Cout[3]), .S(temp_result[4]), .Cout(Cout[4]));
    fulladder fa5   (.A(A[5]), .B(B_true[5]), .Cin(Cout[4]), .S(temp_result[5]), .Cout(Cout[5]));
    fulladder fa6   (.A(A[6]), .B(B_true[6]), .Cin(Cout[5]), .S(temp_result[6]), .Cout(Cout[6]));
    fulladder fa7   (.A(A[7]), .B(B_true[7]), .Cin(Cout[6]), .S(temp_result[7]), .Cout(Cout[7]));

    // Overflow and carry out
    assign V = Cout[N-1] ^ Cout[N-2]; 
    assign C = Cout[N-1];             

    // Result computation and flag setting
    always_comb begin
        case(ALUControl)
            AND: Result = A & B; // AND operation
            OR:  Result = A | B; // OR operation
            default: Result = temp_result; // ADD or SUB
        endcase

        // Negative and Zero flags
        Neg = temp_result[N-1]; // Negative if MSB is 1
        Z = (temp_result == {N{1'b0}}); // Zero if all bits are 0
    end

endmodule
