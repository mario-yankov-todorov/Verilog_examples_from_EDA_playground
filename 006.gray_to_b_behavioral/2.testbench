/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module gray_to_b_behavioral_TB;

	// Inputs
	reg g3;
	reg g2;
  	reg g1;
	reg g0;


	// Outputs
	wire b3;
  	wire b2;
	wire b1;
  	wire b0;
 
  
	// Instantiate the Unit Under Test (UUT)
	gray_to_b_behavioral uut 
  		(
	  	  	.g3(g3),
		  	.g2(g2),
		  	.g1(g1),
	  	  	.g0(g0),
		  	.b3(b3),
		  	.b2(b2),
		  	.b1(b1),
		  	.b0(b0)
		  
		);


	initial begin
	  
	  	$dumpfile("dump.vcd");
	  	$dumpvars(1, gray_to_b_behavioral_TB);
		
		$display("gray_to_b_behavioral_TB");

		$monitor 
	  	(
	   		"%t\|  gray --> %b %b %b %b -- %b %b %b %b <-- binary", 
		  	$time, g3, g2, g1, g0, b3, b2, b1, b0 
	  	);
		
		// Initialize Inputs
	  		// 0
			g3 = 0;
			g2 = 0;
	  		g1 = 0;
			g0 = 0;


		// Add stimulus here
		#10 // 1
			g3 = 0;
			g2 = 0;
	  		g1 = 0;
			g0 = 1;
		#10 // 2
			g3 = 0;
			g2 = 0;
	  		g1 = 1;
			g0 = 1;
		#10 // 3
			g3 = 0;
			g2 = 0;
	  		g1 = 1;
			g0 = 0;
		#10 // 4
			g3 = 0;
			g2 = 1;
	  		g1 = 1;
			g0 = 0;
		#10 // 5
			g3 = 0;
			g2 = 1;
	  		g1 = 1;
			g0 = 1;
		#10 // 6
			g3 = 0;
			g2 = 1;
	  		g1 = 0;
			g0 = 1;
		#10 // 7
			g3 = 0;
			g2 = 1;
	  		g1 = 0;
			g0 = 0;
		#10 // 8
			g3 = 1;
			g2 = 1;
	  		g1 = 0;
			g0 = 0;
		#10 // 9
			g3 = 1;
			g2 = 1;
	  		g1 = 0;
			g0 = 1;
		#10 // 10
			g3 = 1;
			g2 = 1;
	  		g1 = 1;
			g0 = 1;
		#10 // 11
			g3 = 1;
			g2 = 1;
	  		g1 = 1;
			g0 = 0;
		#10 // 12
			g3 = 1;
			g2 = 0;
	  		g1 = 1;
			g0 = 0;
		#10 // 13
			g3 = 1;
			g2 = 0;
	  		g1 = 1;
			g0 = 1;
		#10 // 14
			g3 = 1;
			g2 = 0;
	  		g1 = 0;
			g0 = 1;
		#10 // 15
			g3 = 1;
			g2 = 0;
	  		g1 = 0;
			g0 = 0;

		
		#20 $finish;

	end
	  
endmodule