/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module 	gray_to_b_behavioral 
  	(
		input 		g3,
		input 		g2,
		input 		g1,
		input 		g0,

		output reg	b3,
		output reg  b2,
		output reg  b1,
		output reg  b0
   	);
  
  	
	always @ (g3 or g2 or g1 or g0) begin
	  		
	  					b3 =  g3;

	if (b3 == 1'b1) 	b2 = ~g2;             
	  else				b2 =  g2;
	  
	if (b2 == 1'b1) 	b1 = ~g1;             
	  else				b1 =  g1;
	  
	if (b1 == 1'b1) 	b0 = ~g0;             
	  else				b0 =  g0;
	  
	end


endmodule