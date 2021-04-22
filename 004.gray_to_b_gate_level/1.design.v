/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module 	gray_to_b_gate_level 
	(
		input 	g3,
		input 	g2,
		input 	g1,
		input 	g0,

		output 	b3,
		inout	b2,
		inout	b1,
		inout   b0
   	);
  
  	
  	buf(b3, g3);
  
  	xor(b2, g3, g2);
  	xor(b1, b2, g1);
  	xor(b0, b1, g0);


endmodule