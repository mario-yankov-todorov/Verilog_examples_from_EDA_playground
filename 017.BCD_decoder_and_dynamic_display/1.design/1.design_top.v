`timescale 1ns / 1ps

module top
	(
		input clk, rst,
		input [4	-1:0] binary_in,
		output [4	-1:0] ANODE,
		output A, B, C, D, E, F, G
	
  	);
  
  	reg [16	-1:0] 	data;
  	reg [16	-1:0]  	BCD_out;
   
  	// Instantiate the module binary_to_BCD
  	binary_to_bcd b_to_BCD
  		(
		 	.binary_in 	(binary_in),
		 	.BCD_out 	(BCD_out)

  		);
  
  	// Instantiate the module display
	display DISPLAY 
  		(
			.clk			(clk), 
			.rst			(~rst), 
			.data			(data), 
			.ANODE			(ANODE), 
			.A				(A), 
			.B				(B), 
			.C				(C), 
			.D				(D), 
			.E				(E), 
			.F				(F), 
			.G				(G)
		);

  	b_to_BCD(binary_in);
  
  	DISPLAY(BCD_out);
  
endmodule