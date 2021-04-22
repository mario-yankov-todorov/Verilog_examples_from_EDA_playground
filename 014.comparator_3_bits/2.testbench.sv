/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module comparator_3_bits_TB();
  
   	// Inputs  
  	reg		[3	-1:0] 	in_A;
  	reg		[3	-1:0] 	in_B;
  
	// Output
  	wire	[3	-1:0]   out_C;
  
  	integer a;
   	integer b;
  
  	// Instantiate the Unit Under Test (UUT)
	comparator_3_bits uut 
  		(
	  	  	.in_A		(in_A),
	  		.in_B		(in_B),
	  		.out_C		(out_C)       
		);
  
  	initial begin
	  
	  	$dumpfile("dump.vcd");
	  	$dumpvars
		(
			1, 
		  	comparator_3_bits_TB
		);
		
	  	$display
		(
			"comparator_3_bits_TB"
	  	);
	  
	  	$monitor 
	  	(
	   		"%t\|  in_A = %b  in_B = %b  out_C = %b",
			$time, in_A, in_B, out_C
	  	);


		
		// Initialize Inputs
	  	in_A 	= 	0;
	  	in_B 	= 	0;
		


		// Add stimulus here
		for(a = 0; a < 8; a = a + 1) begin
	  
	  		for(b = 0; b < 8; b = b + 1) begin
	  			#10 in_A = a; in_B = b;
			end
	  
		end
		
		#20 $finish;

	end
	  
endmodule