/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module seven_segment_decoder_dataflow
	(
		input 	[4	-1:0] 	B,
		
  		output 	reg 		a,
		output 	reg 		b,
		output 	reg 		c,
		output 	reg 		d,
		output 	reg 		e,
		output 	reg 		f,
		output 	reg 		g,
		output 	reg 		dot
  	);
  
  
  	assign a = ~(B[3] || (B[2] && B[0]) || (! B[2] && ! B[0]) || B[1]);
  
  	assign b = ~((B[3] && ! B[1] && B[0]) || (! B[3] && B[1] && B[0]) 
		  		|| (! B[3] && ! B[1] && ! B[0]) || ! B[2]);
  
  	assign c = ~((B[3] && ! B[2]) || (! B[3] && B[2]) || (! B[3] && ! B[1]) 
			   	|| (! B[3] && B[0]) || (! B[1] && B[0]));
  
  	assign d = ~((B[3] && ! B[1]) || (! B[3] && ! B[2] && ! B[0]) || (B[2] && B[1]
				&& ! B[0]) || (B[2] && ! B[1] && B[0]) || (!B[2] && B[1] && B[0]));
  
  	assign e = ~((B[3] && B[2]) || (B[3] && B[1]) || (! B[2] && ! B[0]) 
				 || (B[1] && ! B[0]));
  
  	assign f = ~((B[3] && ! B[2]) || (B[3] && B[1]) || (! B[3] && B[2] && ! B[1]) 
				 || (B[2] && ! B[0]) || (! B[1] && ! B[0]));
  
  	assign g = ~((B[3] && ! B[2]) || (B[3] && B[1]) || (! B[3] && B[2] && ! B[1]) 
				 || (! B[2] && B[1]) || (B[1] && ! B[0]));
  
  	assign dot = 0;
  
  
endmodule