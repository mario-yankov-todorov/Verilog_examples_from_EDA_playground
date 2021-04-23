/*
*	M. Todorov 2021
*/


module ALU_top_TB();
  
  	parameter Width	= 4					;
  
   	// Inputs  
	reg		[Width	-1:0]   A			;
	reg		[Width	-1:0]   B			;
	reg		[2    	-1:0]  	ALUControl	;
 
	// Output
  	wire	[Width	-1:0]	Result		;
  	wire	             	Z			;
  	wire	             	N     		;
  	wire	             	C     		;
  	wire	             	V     		; 
	  	
  	integer	             	i     		;
  	integer	             	k     		;
  
  
  	// Instantiate the Unit Under Test (UUT)
  	ALU_top #(Width) uut 
  		(
	  	 	.A         		(A),    
	  		.B         		(B),
		  	.ALUControl		(ALUControl),
		  	.Result    		(Result),
	  	 	.Z         		(Z),    
	  	 	.N         		(N),    
	  	 	.C         		(C),    
	  	 	.V         		(V)    
		);
  
  	initial begin
	  
	 	$dumpfile("dump.vcd");
	  	$dumpvars
		(
			1, 
		  	ALU_top_TB
		);
		
	  	$display
		(
			"ALU_top_TB"
	  	);
	  
	  	$monitor 
	  	(
	   		"%t\|  A = %b  B = %b ALUControl = %b Result = %b Z = %b N = %b C = %b V = %b",
			$time, A, B, ALUControl, Result, Z, N, C, V 
	  	);


		
		// Initialize Inputs
		A         	= 	0	;
		B         	= 	0	;
   		ALUControl	= 	0	;
		


		// Add stimulus here
		for (i = 0; i < (2**(2*Width)) * 4; i = i + 1) begin

			{ALUControl, A, B} = i;
			#10;
		end
		
		#20 $finish;

	end

endmodule