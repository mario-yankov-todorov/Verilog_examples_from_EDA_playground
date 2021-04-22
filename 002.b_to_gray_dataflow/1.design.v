/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module 	b_to_gray_dataflow 
	(
		input 	b3,
		input 	b2,
		input 	b1,
		input 	b0,

		output 	g3,
		output	g2,
		output	g1,
		output  g0
	);
  
  
	//xor gates.
	assign g3 = b3;
	assign g2 = b3 ^ b2;
	assign g1 = b2 ^ b1;
	assign g0 = b1 ^ b0;

endmodule