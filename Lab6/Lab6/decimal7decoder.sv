module decimal7decoder(
    input  logic [3:0] b_in,  
    output logic [6:0] sign_out, 
    output logic [6:0] digit_out 
);

    logic [3:0] abs_value; 
    logic is_negative;      

	 
    assign is_negative = b_in[3];  


    always_comb begin
        if (is_negative)
            abs_value = (~b_in + 1); 
        else
            abs_value = b_in;         
    end

    always_comb begin
        if (is_negative)
            sign_out = 7'b0111111;  
        else
            sign_out = 7'b1111111;  
    end

   
    always_comb begin
        case (abs_value)
            4'b0000: digit_out = 7'b1000000; // "0"
            4'b0001: digit_out = 7'b1111001; // "1"
            4'b0010: digit_out = 7'b0100100; // "2"
            4'b0011: digit_out = 7'b0110000; // "3"
            4'b0100: digit_out = 7'b0011001; // "4"
            4'b0101: digit_out = 7'b0010010; // "5"
            4'b0110: digit_out = 7'b0000010; // "6"
            4'b0111: digit_out = 7'b1111000; // "7"
            4'b1000: digit_out = 7'b0000000; // "8" 
            default: digit_out = 7'b1111111; 
        endcase
    end

endmodule
