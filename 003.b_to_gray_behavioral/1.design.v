/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module 	b_to_gray_behavioral
	(
		input 		b3,
		input 		b2,
		input 		b1,
		input 		b0,

		output reg 	g3,
		output reg	g2,
		output reg	g1,
		output reg  g0
	);
  
  
  always @ (b3 or b2 or b1 or b0) begin
	  		
	  					g3 =  b3;

	  if (b3 == 1'b1) 	g2 = ~b2;             
	  else				g2 =  b2;
	  
	  if (b2 == 1'b1) 	g1 = ~b1;             
	  else				g1 =  b1;
	  
	  if (b1 == 1'b1) 	g0 = ~b0;             
	  else				g0 =  b0;
	  
	end

endmodule