/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module priority_encoder
  	(
		input		   			i7,
		input		   			i6,
		input		   			i5,
		input		   			i4,
		input		   			i3,
		input		   			i2,
		input		   			i1,
		input		   			i0,
		
		output reg	[3	-1:0] 	out,
		output reg				IDLE
  	);
	
	integer b;
	
	always @(*)
  		begin
			out = 3'b000;
		  	if     (i7) out = 3'b111;
		  	else if(i6) out = 3'b110;
		  	else if(i5) out = 3'b101;
		  	else if(i4) out = 3'b100;
		  	else if(i3) out = 3'b011;
		  	else if(i2) out = 3'b010;
		  	else if(i1) out = 3'b001;
		  	else if(i0) out = 3'b000;
		  
		 	if (i7 == 0 && i6 == 0 && i5 == 0 && i4 == 0 &&
			   	i3 == 0 && i2 == 0 && i1 == 0 && i0 == 0)	
			 		IDLE = 1'b1;
			else 	IDLE = 1'b0;

  		end    
		
endmodule