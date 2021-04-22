/*
*	M. Todorov 2021
*/


module binary_to_bcd
  	(
		input 	[13	-1:0] 	binary_in,
	
		output reg	[16	-1:0]   BCD_out
	
  	);
  
  
  	always @(*) begin
  
		// Create a register to concatenate
  		// the input data with 16 zeros. 
  		// This will allow the Double 
  		// Dabble algorithm to be used
  	
  		reg 	[29		-1:0] 	double_dabble_data;
		reg   [16		-1:0]   zeroes = 16'b0000000000000000;
  		integer i;
  		
  		double_dabble_data = {zeroes,binary_in};
  	
		   
		for(i = 13; i > 0; i = i - 1) begin
			
		  	// First nibble
		  	if(double_dabble_data[16:13] > 4) begin
		  	  
				double_dabble_data[28:13] = double_dabble_data[28:13] + 3;
		  	end
		  	
		  	// Second nibble
		  	if(double_dabble_data[20:17] > 4) begin
		  	  
			  	double_dabble_data[28:17] = double_dabble_data[28:17] + 3;
		  	end
		  	
		  	// Third nibble
		  	if(double_dabble_data[24:21] > 4) begin
		  	  
			  	double_dabble_data[28:21] = double_dabble_data[28:21] + 3;
		  	end
		  	
		  	// Fourth nibble
		  	if(double_dabble_data[28:25] > 4) begin
		  	  
		  	  	double_dabble_data[28:25] = double_dabble_data[28:25]	+ 3;
		  	end
		  	
		  	// Shift with one
				double_dabble_data = double_dabble_data << 1;
		   
   		end
			BCD_out  = double_dabble_data[28:13];

 	end
	
 endmodule