/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module priority_encoder_TB();
  
   	// Inputs  
  	reg		i7;
	reg		i6;
	reg		i5;
	reg		i4;
	reg		i3;
	reg		i2;
	reg		i1;
	reg		i0;
 
	// Output
  	wire	[3	-1:0] 	out;
  	wire               IDLE;
   
	integer i;
  
  
  	// Below you can see why these
  	// variables are commented out
  
	// integer a;
	// integer b;
	// integer c;
	// integer d;
	// integer e;
	// integer f;
	// integer g;
	// integer h;
	
  
  	// Instantiate the Unit Under Test (UUT)
	priority_encoder uut 
  		(
	  		.i7  (i7),
	  		.i6  (i6),
	  		.i5  (i5),
	  		.i4  (i4),
	  		.i3  (i3),
	  		.i2  (i2),
	  		.i1  (i1),
	  		.i0  (i0),
	  		.out (out),
	  		.IDLE (IDLE)
		);
  
  	initial begin
	  
	 	$dumpfile	("dump.vcd");
	  	$dumpvars
		(
			1, 
		  	priority_encoder_TB
		);
		
	  	$display
		(
			"priority_encoder_TB"
	  	);
	  
	  	$monitor 
	  	(
	   		"%t\|  i7 = %b i6 = %b i5 = %b i4 = %b i3 = %b i2 = %b i1 = %b i0 = %b out = %b IDLE = %b",
			$time, i7, i6, i5, i4, i3, i2, i1, i0, out, IDLE 
	  	);


		
		// Initialize Inputs
		i7	=	0;
		i6	=	0;
		i5	=	0;
		i4	=	0;
		i3	=	0;
		i2	=	0;
		i1	=	0;
		i0	=	0;
	
	
		 // We can use the following instead of
		// what is commented below  
	
		for (i = 0; i < 2**8; i = i + 1) begin
			{i7, i6, i5, i4, i3, i2, i1, i0} = i;
			#10;
		end
		

	//	    Add stimulus here
	//	for(a = 0; a < 2; a = a + 1) begin
	//	  #10 	i7	=  a;
	//	  for(b = 0; b < 2; b = b + 1) begin
	//	     #10	  i6  =  b;
	//	    for(c = 0; c < 2; c = c + 1) begin
	//	  	#10		i5  =  c;	
	//	      for(d = 0; d < 2; d = d + 1) begin
	//	  	   #10	  i4  =  d;	
	//	        for(e = 0; e < 2; e = e + 1) begin
	//	  		#10		i3  =  e;
	//	          for(f = 0; f < 2; f = f + 1) begin
	//	  		   #10	  i2  =  f;	
	//	            for(g = 0; g < 2; g = g + 1) begin
	//	  			#10		i1  =  g;	
	//	             for(h = 0; h < 2; h = h + 1) begin
	//	  			  #10	 i0  =  h;	
	//								end
	//							end
	//						end
	//					end
	//				end
	//			end
	//		end     
	//	end
			
	#20 $finish;

end
	  
endmodule