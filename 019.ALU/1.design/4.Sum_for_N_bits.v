module Sum_for_N_bits 
  	#(
   	 	parameter Width = 4
  	)
  	(
		input	[Width	-1:0] 		First		,
		input	[Width	-1:0]		Second		,
		input						Cin			,			
	
		output 	[Width	-1:0]		Sum			,
		output						Cout		    
  	);
  
  
	assign {Cout, Sum} = First + Second + Cin;
  
endmodule 