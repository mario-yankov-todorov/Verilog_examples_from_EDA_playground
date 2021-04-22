module Not_N_bits_Then_Reduction_And
  	#(
		parameter Width = 4
  	)
  	(
  		input 	[Width		-1:0] 	Input,   
		output 	 					Output
  	);
  

  	assign Output = & (~Input) ;

endmodule