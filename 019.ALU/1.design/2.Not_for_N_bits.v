// Here are two possible solutions:
// 1. With a loop that is placed in generate
// 2. With the bitwise operator - ~ (negation)
// ----------------------------------------
// The keyword `define is used to switch 
// between the two solutions. Switching is 
// done by commenting and uncommenting some 
// of the following two lines

// `define for_loop_not
`define simple_not

module Not_for_N_bits
  	#(
		parameter Width = 4
 	)
  	(
  		input 	[Width	-1:0] 	Input	,   
		output 	[Width	-1:0] 	Output
  	);
  
  	`ifdef  for_loop_not
  
		genvar i;
		generate
	  	for (i = 0; i < Width; i = i + 1) begin
			not (Output[i], Input[i]);
	  	end
		endgenerate
  
   	`elsif simple_not
  
  		assign Output = ~ Input;
  
  	`endif
  
endmodule


  
  