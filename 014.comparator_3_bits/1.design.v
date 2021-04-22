/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module comparator_3_bits
  	(
		input 	[3	-1:0] 	in_A,
		input 	[3	-1:0] 	in_B,
		
		output  [3	-1:0]   out_C
	
  	);
  
  	reg [3	-1:0] GT = 3'b100;
  	reg [3	-1:0] LT = 3'b010;
  	reg [3	-1:0] EQ = 3'b001;
  
  
	always @(*)  
  
		//	greater than
  		if (in_A > in_B) begin
		 	assign out_C = GT;
  		end
  	
  		//	less than
  		if (in_A < in_B) begin
			assign out_C = LT;
  		end
  	
  		//	equal
  		if (in_A == in_B) begin
			assign  out_C = EQ;
  		end

endmodule