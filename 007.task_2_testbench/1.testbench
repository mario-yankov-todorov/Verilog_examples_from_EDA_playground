/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module task_2_testbench;

	// Inputs  
  	reg 	A;
  	reg 	G1;
  	reg 	G2;


	initial begin
	  
	  $dumpfile("dump.vcd");
	  $dumpvars(1, task_2_testbench);
		
	  $display("task_2_testbenc");


		
		// Initialize Inputs
	  	A 	= 	0;
	  	G1 	= 	0;
	  	G2	=	1;
			

		// Add stimulus here
	  	#40
	  	A	=	1;
	  	#20
	  	G1	=	1;
		#20
	  	G2	=	0;
		#20
	  	A	=	0;
		#20
	  	G1	=	0;
		#20
	  	G2	=	1;
	  
		
		#20 $finish;

	end
	  
endmodule


