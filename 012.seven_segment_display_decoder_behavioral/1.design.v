/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module seven_segment_decoder_behavioral
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
  
  	always @ (*) begin
  	
  		if (B == 1 || B == 4 || B == 11 || B == 13) 
  			a = 1;
  		
  		else 
  		  	a = 0;
  		
  		  
  		
  		if (B == 5 || B == 6 || B == 11 || B == 12 || B == 14 || B == 15) 
  			b = 1;
  		
  		else
  		  	b = 0;
  		
  		
  		if (B == 2 || B == 12 || B == 14 || B == 15) 
  			c = 1;
  		
  		else
  		  	c = 0;
  		
  		
  		if (B == 1 || B == 4 || B == 7 || B == 10 || B == 15) 
  			d = 1;
  		
  		else
  		  	d = 0;
  		
  		
  		if (B == 1 || B == 3 || B == 4 || B == 5 || B == 7 || B == 9) 
  			e = 1;
  		
  		else
  		  	e = 0;
  		
  		
  		if (B == 1 || B == 2 || B == 3 || B == 7 || B == 13) 
  			f = 1;
  		
  		else
  		  	f = 0;
  		
  		
  		if (B == 0 || B == 1 || B == 7 || B == 12) 
  			g = 1;
  		
  		else
  		  	g = 0;
		  
  	end
	
  	
  	assign dot = 0;
  
  
endmodule