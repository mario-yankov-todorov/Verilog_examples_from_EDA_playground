/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module code_lock_TB;

	// Inputs  
  	reg 	A;
  	reg 	M;
  	reg 	C;
  
  	// Output
  	wire	F;
  
  	// Instantiate the Unit Under Test (UUT)
	code_lock uut 
  		(
	  	  	.A(A),
		  	.M(M),
		  	.C(C),
	  	  	.F(F)         
		);


	initial begin
	  
	  	$dumpfile("dump.vcd");
	  	$dumpvars(1, code_lock_TB);
		
	 	$display("code_lock_TB");
	  
	  	$monitor 
	  	(
	   		"%t\|  A = %b  M = %b  C = %b    F = %b",
		  	$time, A, M, C, F
	  	);


		
		// Initialize Inputs
	  	A 	= 	0;
	  	M 	= 	0;
	  	C	=	0;
			

		// Add stimulus here
	  	#10
	  	A 	= 	0;
	  	M 	= 	0;
	  	C	=	1;
	  	#10
	  	A 	= 	0;
	  	M 	= 	1;
	  	C	=	0;
		#10
	  	A 	= 	0;
	  	M 	= 	1;
	  	C	=	1;
		#10
	  	A 	= 	1;
	  	M 	= 	0;
	  	C	=	0;
		#10
	  	A 	= 	1;
	  	M 	= 	0;
	  	C	=	1;
		#10
	  	A 	= 	1;
	  	M 	= 	1;
	  	C	=	0;
		#10
	  	A 	= 	1;
	  	M 	= 	1;
	  	C	=	1;
	  
		
		#20 $finish;

	end
	  
endmodule


