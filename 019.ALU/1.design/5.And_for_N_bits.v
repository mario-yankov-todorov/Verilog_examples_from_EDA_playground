// Here are two possible solutions:
// 1. With a loop that is placed in generate
// 2. With the bitwise operator - & (and)
// ----------------------------------------
// The keyword `define is used to switch 
// between the two solutions. Switching is 
// done by commenting and uncommenting some 
// of the following twobb    lines

`define for_loop_and
// `define simple_and

module And_for_N_bits
  	#(
		parameter Width = 4
  	)
  	(
		input 	[Width	-1:0] 	First,
		input 	[Width	-1:0] 	Second,
	
		output 	[Width	-1:0] 	Output
  	);
  
  	`ifdef  for_loop_and
  
		genvar i;
		generate
	  	for (i = 0; i < Width; i = i + 1) begin
			and (Output[i], First[i], Second[i]);
	  	end
		endgenerate
  
   	`elsif simple_and
  
  		Output = First & Second;
  
  	`endif
  
endmodule


  
  