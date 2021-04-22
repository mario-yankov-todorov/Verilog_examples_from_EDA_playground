/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module multiplier_of_two_bit_numbers_TB();
  
   	// Inputs  
  	reg		[2		-1:0] 		A;
  	reg		[2		-1:0] 		B;
  
	// Output
  	wire	[4		-1:0] 		P;
  
  	integer a;
   	integer b;
  
  	// Instantiate the Unit Under Test (UUT)
	multiplier_of_two_bit_numbers uut 
		(
	  	 	.A		(A),
	  		.B		(B),
	  		.P		(P)       
		);
  
	initial begin
	  
		$dumpfile("dump.vcd");
	  	$dumpvars
			(
				1, 
		  		multiplier_of_two_bit_numbers_TB
			);
		
	  	$display
			(
				"multiplier_of_two_bit_numbers_TB"
	  		);
	  
	  	$monitor 
	  		(
	   			"%t\|  A = %b  B = %b  P = %b",
				$time, A, B, P
	  		);


		
		// Initialize Inputs
	  	A 	= 	0;
	  	B 	= 	0;
		


		// Add stimulus here
		for(a = 0; a < 4; a = a + 1) begin
	  
	  		for(b = 0; b < 4; b = b + 1) begin
	  			#10 A = a; B = b;
			end
	  
		end
		
		#20 $finish;

	end
	  
endmodule