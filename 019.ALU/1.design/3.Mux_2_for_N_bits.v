module Mux_2_for_N_bits
	#(
		parameter 	Width = 4
 	)
  	(
	  	input	[Width	-1:0]		First			,
	  	input	[Width	-1:0]		Second			,
		input						Switch			,	
	  	output	[Width	-1:0]		Output			
	);
  

	assign Output	= Switch ? 	Second : First;
  
endmodule