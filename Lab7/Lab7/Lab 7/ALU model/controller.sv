module controller(
    input logic CLKb,            // Debounced clock signal
    output logic enA,           // Enable for register A
    output logic enC,           // Enable for register C
    output logic enALU          // Enable for ALU control signals
);

    // State enumeration for better readability
    typedef enum logic [1:0] {  
        S_GET_OPERATION = 2'b00, // State to get the operation
        S_GET_A_INPUT = 2'b01,   // State to get A input
        S_STORE_RESULT = 2'b10,   // State to store the result
        S_DEFAULT = 2'b11         // Default state
    } state_t;

    state_t crr_state, next_state; // State variables

    // Sequential logic for state transitions
    always_ff @(negedge CLKb) begin
        crr_state <= next_state;  // Update the current state on clock edge
    end

    always_comb begin
        // Default disable for all control signals
        {enA, enC, enALU} = 3'b000; 

        // Determine next state and enable signals based on current state
        case (crr_state)
            S_GET_OPERATION: begin
                enALU = 1'b1;            // Enable ALU for operation
                next_state = S_GET_A_INPUT; // Transition to get A input
            end
            
            S_GET_A_INPUT: begin
                enA = 1'b1;              // Enable A register to store input
                next_state = S_STORE_RESULT; // Transition to store result
            end
            
            S_STORE_RESULT: begin
                enC = 1'b1;              // Enable C register to store result
                next_state = S_GET_OPERATION; // Loop back to get operation
            end
            
            default: begin
                next_state = S_GET_OPERATION; // Reset to initial state
            end
        endcase
    end

endmodule
