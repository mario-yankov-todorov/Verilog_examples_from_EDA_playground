/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module top_TB();

  
	// Input
 	reg   			clk;
  	reg   			rst;
 	reg  [4	-1:0] 	binary_in;

  
  	// Outputs
  	wire  [4	-1:0] ANODE;
  	wire  A, B, C, D, E, F, G;
  
  	integer k;
  
  	// Instantiate the Unit Under Test (UUT)
	top uut 
  		(
	  		clk			(clk), 
	  		rst			(rst),
	 		binary_in	(binary_in),
	  		ANODE		(ANODE),
	  		A			(A),
	  		B			(B),
	  		C			(C),
	  		D			(D),
	  		E			(E),
	  		F			(F),
	  		G			(G)
		);			
  
  	initial begin
  
		$dumpfile("dump.vcd");
		$dumpvars
		(
		   	1, 
		   	top_TB
   		); 
	
   		$display
   		(
	   		"top_TB"
   		);
	  
		$monitor 
   		(
   			"%t\|  ANODE = %b A = %b B = %b C = %b D = %b E = %b F = %b G = %b",
	  		$time, ANODE, A, B, C, D, E, F, G
   		);

	
	
		rst 	= 	0;
		digit 	= 	0;
		
		for(k = 0; k < 16; k = k + 1) begin
			#10 digit = digit + 1;
		end
		  
  		#10 $finish;
	  
   end
 
endmodule