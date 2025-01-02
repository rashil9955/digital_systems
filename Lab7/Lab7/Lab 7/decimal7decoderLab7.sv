module decimal7decoderLab7(
    input  logic [3:0] b_in,      // 4-bit binary input (0 to 15)
    output logic [6:0] digit_out   // 7-segment output for the number
);

    // 7-segment encoding for the input value (0 - F)
    always_comb begin
        case (b_in)
            4'b0000: digit_out = 7'b1000000; // "0"
            4'b0001: digit_out = 7'b1111001; // "1"
            4'b0010: digit_out = 7'b0100100; // "2"
            4'b0011: digit_out = 7'b0110000; // "3"
            4'b0100: digit_out = 7'b0011001; // "4"
            4'b0101: digit_out = 7'b0010010; // "5"
            4'b0110: digit_out = 7'b0000010; // "6"
            4'b0111: digit_out = 7'b1111000; // "7"
            4'b1000: digit_out = 7'b0000000; // "8"
            4'b1001: digit_out = 7'b0010000; // "9"
            4'b1010: digit_out = 7'b0001000; // "A"
            4'b1011: digit_out = 7'b0000011; // "B"
            4'b1100: digit_out = 7'b1000110; // "C"
            4'b1101: digit_out = 7'b0100001; // "D"
            4'b1110: digit_out = 7'b0000110; // "E"
            4'b1111: digit_out = 7'b0001110; // "F"
            default: digit_out = 7'b1111111; // off
        endcase
    end

endmodule
