`include "half_adder.sv"

module full_adder 
  	(
  		input 		A,  
  		input 		B,
  		input	 	carry_in,

  		output 		sum,
		output 		carry_out
	);
  
  
  	half_adder u1 
  		(
			.A			(A),
		  	.B			(B),
			.sum		(sum),
			.carry_out	(carry_out)
		);
  
  
  	assign sum = A ^ B ^ carry_in;
  
  	assign carry_out = (A & B) | (B & carry_in) | (A & carry_in);
  
endmodule