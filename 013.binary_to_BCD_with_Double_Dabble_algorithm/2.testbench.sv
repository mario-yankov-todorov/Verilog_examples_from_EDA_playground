/*
*	M. Todorov 2021
*/

module binary_to_bcd_TB();

  
  	// Input
  	reg  [13	-1:0] 	binary_in;
  
  	// Outputs
  	wire [16	-1:0]   BCD_out;
  
  	integer k;
  
  	// Instantiate the Unit Under Test (UUT)
	binary_to_bcd uut 
  	(
	  	.binary_in		(binary_in),
	  	.BCD_out			(BCD_out)
	);
  
  	initial begin
  
		$dumpfile("dump.vcd");
		$dumpvars
		(
		  	1, 
		  	binary_to_bcd_TB
		); 
	
   		$display
		(
			"binary_to_bcd_TB"
	  	);
	  
		$monitor 
	  	(
	   		"%t\|  BCD_out = %b",
			$time, BCD_out
	  	);

	
		binary_in = 13'b0;
	
	
		for(k = 0; k < 4900; k = k + 1) begin
	  		#10 binary_in = binary_in + 13'b0001;
		end
	  
	  	#10 $finish;
	  
  	end
 
endmodule