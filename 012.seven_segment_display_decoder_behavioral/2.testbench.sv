/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module seven_segment_decoder_behavioral_TB();
  
  	reg [3:0] B;
  	wire a, b, c, d, e, f, g, dot;
  
  	integer k;
  
  	// Instantiate the Unit Under Test (UUT)
	seven_segment_decoder_behavioral uut 
  		(
	  	.B		(B),
	  	.a		(a),
	  	.b		(b), 
	  	.c		(c),
	  	.d		(d),
	  	.e		(e),
	  	.f		(f),
	  	.g		(g),
	  	.dot	(dot)
		);
  
  	initial begin
  
		$dumpfile("out.vcd");
		$dumpvars
		(
		  	1, 
		  	seven_segment_decoder_behavioral_TB
		); 
	
   		$display
		(
			"seven_segment_decoder_behavioral_TB"
	  	);
	  
		$monitor 
	  	(
	   		"%t\|  B = %b  a = %b  b = %b  c = %b d = %b  e = %b  f = %b  g = %b  dot = %b",
			$time, B, a, b, c, d, e, f, g, dot
	  	);

	
		B = 4'b0000;
	
	
		for(k = 0; k < 15; k = k + 1) begin
	  		#10 B = B + 4'b0001;
		end
	  
	  	#10;
	  
   	end    
  
endmodule