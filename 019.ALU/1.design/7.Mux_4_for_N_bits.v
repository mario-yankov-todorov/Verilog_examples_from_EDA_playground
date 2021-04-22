module Mux_4_for_N_bits
	#(
		parameter 	Width = 4
 	)
  	(
	  	input	[Width	-1:0]		First			,
	  	input	[Width	-1:0]		Second			,
	  	input	[Width	-1:0]		Third			,
	  	input	[Width	-1:0]		Fourth			, 
	  
	  	input	[2		-1:0]		Switch			,
	  
	  	output	[Width	-1:0]		Output			
	);
  
  	assign Output = Switch[1] ? 	(Switch[0] ? 	Fourth : Third)
								:	(Switch[0] ? 	Second : First);
  
endmodule