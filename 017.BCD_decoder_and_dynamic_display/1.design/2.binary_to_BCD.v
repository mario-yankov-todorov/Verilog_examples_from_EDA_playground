/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module binary_to_bcd
  	(
		input 	[4	-1:0] 	binary_in,
	
		output reg	[16	-1:0]   BCD_out
	
  	);
  
  
  	always @(*) begin
  
		// Create a register to concatenate
  		// the input data with 16 zeros. 
  		// This will allow the Double 
  		// Dabble algorithm to be used
  
		reg 	[20		-1:0] 	double_dabble_data;
	  	reg   	[16		-1:0]   zeroes = 16'b0000000000000000;
  		integer i;
  
  		double_dabble_data = {zeroes,binary_in};
  
	   
		for(i = 4; i > 0; i = i - 1) begin
			   
			// First nibble
		  	if(double_dabble_data[7:4] > 4) begin
			
				double_dabble_data[19:4] =
				double_dabble_data[19:4]	+ 3;
		  	end
		  
		  	// Second nibble
		  	if(double_dabble_data[11:8] > 4) begin
			
				double_dabble_data[19:8] =
				double_dabble_data[19:8]	+ 3;
		  	end
		  
		   	// Third nibble
		  	if(double_dabble_data[15:12] > 4) begin
			
				double_dabble_data[19:12] =
				double_dabble_data[19:12]	+ 3;
		  	end
		  
		  	// Fourth nibble
		  	if(double_dabble_data[19:16] > 4) begin
				double_dabble_data[19:16] =
				double_dabble_data[19:16]	+ 3;
		  	end
		  
		  	// Shift with one
			double_dabble_data = double_dabble_data << 1;
		   
		end
		
		BCD_out  = double_dabble_data[11:4];

  	end
	
endmodule