/*
*	M. Todorov 2021
*/

`timescale 1ns / 1ps

module decoder
  	(
		input	[4	-1:0]   in,
	
		output reg	[16	-1:0] 	out
  	);
	
	integer b;
	
	always @(*)
			 
  
	assign out[0]=  (~in[0]) & (~in[1]) &(~in[2]) & (~in[3]);
	assign out[1]=  (~in[0]) & (~in[1]) &(~in[2]) & (in[3]);
	assign out[2]=  (~in[0]) & (~in[1]) &(in[2]) & (~in[3]);
	assign out[3]=  (~in[0]) & (~in[1]) &(in[2])  & (in[3]);
	assign out[4]=  (~in[0]) & (in[1]) &(~in[2]) & (~in[3]);
	assign out[5]=  (~in[0]) & (in[1]) &(~in[2])  & (in[3]);
	assign out[6]=  (~in[0]) & (in[1]) &(in[2])  & (~in[3]);
	assign out[7]=  (~in[0]) & (in[1]) &(in[2])  & (in[3]);

	assign out[8]=  (in[0]) & (~in[1]) &(~in[2]) & (~in[3]);
	assign out[9]=  (in[0]) & (~in[1]) &(~in[2]) & (in[3]) ;
	assign out[10]= (in[0]) & (~in[1]) &(in[2]) & (~in[3]) ;
	assign out[11]= (in[0]) & (~in[1]) &(in[2])  & (in[3]) ;
	assign out[12]= (in[0]) & (in[1]) &(~in[2]) & (~in[3]) ;
	assign out[13]= (in[0]) & (in[1]) &(~in[2])  & (in[3]) ;
	assign out[14]= (in[0]) & (in[1]) &(in[2])  & (~in[3]) ;
	assign out[15]= (in[0]) & (in[1]) &(in[2])  & (in[3]);

endmodule