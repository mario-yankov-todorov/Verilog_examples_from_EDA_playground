/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module multiplier_of_two_bit_numbers
	(
		input	[2	-1:0] 	A,
		input	[2	-1:0] 	B,
	
		output	[4	-1:0] 	P
	);
  
  	assign P = A * B;
  
endmodule
