module fWXYZtoplevel(
	input logic switch0, switch1, switch2, switch3,
	output logic led0, led1
);

functionWXYZ norm(.W(switch0), .X(switch1), .Y(switch2), .Z(switch3), .F(led1) );

functionWXYZsimplified simp(.W(switch0), .X(switch1), .Y(switch2), .Z(switch3), .F(led0) );

endmodule 