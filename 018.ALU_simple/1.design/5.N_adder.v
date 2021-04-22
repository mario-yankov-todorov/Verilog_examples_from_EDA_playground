`include "full_adder.sv"
`include "mux2_1.sv"

module N_adder 
	#(
  		parameter N = 4
	) 
  	(
	   	input  	[N	-1:0] 	A,
		input  	[N	-1:0] 	B,
	  	input 	[2	-1:0] 	alu_control, 
		output 	[N	-1:0] 	sum
  	);
  
  
  	wire 	[N	-1:0] 	carry;
  	wire  			carry_out;
  
  
  	mux2_1 ut
  		(
			.mux_out		(B),
	  		.alu_control	(alu_control)
		);
  
  
	//Implementation of genvar
  	genvar i;
  	generate
	  	for(i = 0; i < N; i = i+1) begin: generate_N_bit_Adder
	  		if(i == 0)
		
				half_adder inst_1(A[0], B[0],sum[0], carry [0]);
	  
	  		else
		
				full_adder inst_2(A[0], B[0], carry [i-1], sum[i],carry[i]);
	  
		end
	  
 		assign carry_out = carry[N-1];
		 
	endgenerate
  
endmodule