/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module b_to_gray_gate_level_TB;

	// Inputs
	reg b3;
	reg b2;
  	reg b1;
	reg b0;


	// Outputs
	wire g3;
  	wire g2;
	wire g1;
  	wire g0;
 
  
	// Instantiate the Unit Under Test (UUT)
	b_to_gray_gate_level uut (
		  .b3(b3),
		  .b2(b2),
		  .b1(b1),
		  .b0(b0),
		  .g3(g3),
		  .g2(g2),
		  .g1(g1),
		  .g0(g0)
	);


	initial begin
	  
	  	$dumpfile("dump.vcd");
		$dumpvars(1,     b_to_gray_gate_level_TB);
		
		$display("b_to_gray_gate_level_TB");

	$monitor 
	  (
	   "%t\|  binary --> %b %b %b %b -- %b %b %b %b <-- gray", $time, b3, b2, b1, b0, g3, g2, g1, g0
	  );
		
		// Initialize Inputs
	  		// 0
			b3 = 0;
			b2 = 0;
	  		b1 = 0;
			b0 = 0;


		// Add stimulus here
		#10 // 1
			b3 = 0;
			b2 = 0;
	  		b1 = 0;
			b0 = 1;
		#10 // 2
			b3 = 0;
			b2 = 0;
	  		b1 = 1;
			b0 = 0;
		#10 // 3
			b3 = 0;
			b2 = 0;
	  		b1 = 1;
			b0 = 1;
		#10 // 4
			b3 = 0;
			b2 = 1;
	  		b1 = 0;
			b0 = 0;
		#10 // 5
			b3 = 0;
			b2 = 1;
	  		b1 = 0;
			b0 = 1;
		#10 // 6
			b3 = 0;
			b2 = 1;
	  		b1 = 1;
			b0 = 0;
		#10 // 7
			b3 = 0;
			b2 = 1;
	  		b1 = 1;
			b0 = 1;
		#10 // 8
			b3 = 1;
			b2 = 0;
	  		b1 = 0;
			b0 = 0;
		#10 // 9
			b3 = 1;
			b2 = 0;
	  		b1 = 0;
			b0 = 1;
		#10 // 10
			b3 = 1;
			b2 = 0;
	  		b1 = 1;
			b0 = 0;
		#10 // 11
			b3 = 1;
			b2 = 0;
	  		b1 = 1;
			b0 = 1;
		#10 // 12
			b3 = 1;
			b2 = 1;
	  		b1 = 0;
			b0 = 0;
		#10 // 13
			b3 = 1;
			b2 = 1;
	  		b1 = 0;
			b0 = 1;
		#10 // 14
			b3 = 1;
			b2 = 1;
	  		b1 = 1;
			b0 = 0;
		#10 // 15
			b3 = 1;
			b2 = 1;
	  		b1 = 1;
			b0 = 1;

		
		#20 $finish;

	end
	  
endmodule