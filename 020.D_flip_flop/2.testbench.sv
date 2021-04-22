/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module D_flip_flop_TB;

	// Inputs
	reg 	D		;
	reg 	CLK		;

	// Output
  	wire 	Q		;
 
  
	// Instantiate the Unit Under Test (UUT)
	D_flip_flop uut 
  		(
	  	 	.D		(D),
	  		.CLK	(CLK),
		  	.Q		(Q)
		);
  
  	always begin
  		#10  CLK = ~ CLK;

  	end


	initial begin
	  
	  	$dumpfile("dump.vcd");
	  	$dumpvars(1, D_flip_flop_TB);
		
		$display("D_flip_flop_TB");

		$monitor 
	  	(
	   		"%t\| D = %b  Q = %b",
	   		$time, D, Q 
	  	);
		
	  	// Initialize Inputs
	  	CLK 	= 1;
		D 		= 0;

		// Add stimulus here
	  	#40
	  	D 	= 	1;
	  	#40
	  	D 	= 	0;
		 
		
		#40 $finish;

	end
	  
endmodule