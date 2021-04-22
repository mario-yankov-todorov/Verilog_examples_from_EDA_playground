module mux2_1
  	(
		input 					B, 
	  	input 		[2	-1:0] 	alu_control,
	  	output reg 				mux_out
	);
  
  
  	wire B_bar;
  	not (B_bar, B);
  
  	assign mux_out = (alu_control) ? B_bar : B;
  
endmodule