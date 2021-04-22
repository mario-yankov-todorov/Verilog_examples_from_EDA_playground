/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module 	b_to_gray_gate_level 
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
  
  	
  buf(g3, b3);
  
  xor(g2, b3, b2);
  xor(g1, b2, b1);
  xor(g0, b1, b0);


endmodule