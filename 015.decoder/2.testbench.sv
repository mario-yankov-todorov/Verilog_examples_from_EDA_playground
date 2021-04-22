/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module decoder_TB();
  
   	// Inputs  
  	reg		[4	-1:0]   in;
 
	// Output
  	wire	[16	-1:0] 	out;
  	integer a;
  
  	// Instantiate the Unit Under Test (UUT)
	decoder uut 
  		(
	  		.in		(in),
	  
			.out	(out)

		);
  
  	initial begin
	  
	  	$dumpfile("dump.vcd");
	  	$dumpvars
		(
			1, 
		  	decoder_TB
		);
		
	  	$display
		(
			"decoder_TB"
	  	);
	  
	  	$monitor 
	  	(
	   		"%t\|  in = %b  out = %b",
			$time, in, out 
	  	);


		
		// Initialize Inputs
		in = 0;
		


		// Add stimulus here
		for(a = 0; a < 16; a = a + 1)	begin
	  		#10 in = a;
	  
		end
		
		#20 $finish;

	end
	  
endmodule