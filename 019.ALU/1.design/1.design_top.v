/*
*	M. Todorov 2021
*/

`include "Not_for_N_bits.sv"
`include "Mux_2_for_N_bits.sv"
`include "Sum_for_N_bits.sv"
`include "And_for_N_bits.sv"
`include "Or_for_N_bits.sv"
`include "Mux_4_for_N_bits.sv"
`include "Not_N_bits_Then_Reduction_And.sv"

module ALU_top
  	#(
	  	parameter 	Width = 4
	)
	(
	  	input	[Width	-1:0] 		A			,
	  	input	[Width	-1:0]		B			,
	  	input	[2		-1:0]		ALUControl	,
	  
	  	output	[Width	-1:0]		Result		,
	  	output						Z			,
	  	output						N			,
	  	output						C			,
	  	output						V			      
	);
  
  	wire 	[Width	-1:0] 		Not_B				;
  	wire 	[Width	-1:0] 		B_or_not_B			;
  
  	// Result_00 and Result_01
  	wire	[Width	-1:0] 		Sum					; 
  	wire 						Cout				;
  	wire	[Width	-1:0] 		Result_10			;
  	wire	[Width	-1:0] 		Result_11			;
  	wire						not_ALUControl_1	;
  	wire						xnor_ALU0_Amsb_Bmsb	;
	wire						xor_Amsb_Sum_msb	;
  
  
  
  
  	// Send input B to module Not_for_N_bits. 
  	// In module Not_for_N_bits every bit of 
  	// input B will be inverted in its not form. 
  	Not_for_N_bits	 #(Width)	not_b
  		(
		  	.Input			(B),
		  
		  	.Output			(Not_B)
  		);
  
  	// Send input B and the first bit of the
  	// ALUControl input to module Mux_2_for_N_bits. 
  	// In module Mux_2_for_N_bits one of the two 
  	// inputs will be selected - B or not B,
  	// according to the value of the first bit
  	// of the ALUControl input.
  	Mux_2_for_N_bits  #(Width) 	mux_b_not_b
  		(
		  	.First			(B), 
		  	.Second			(Not_B),  
		  	.Switch			(ALUControl[0]),
		  
		  	.Output			(B_or_not_B)
  		);
  
  	// Send the first bit of the ALUControl 
  	// input to module Sum.
	// The first bit of the input ALUControl
	// will be used as Cin, to add the required
	// value of 1 when subtracting B from A.
  	Sum_for_N_bits 	  #(Width) 	sum
  		(
		  	.First				(A),
		  	.Second				(B_or_not_B),          
		  	.Cin				(ALUControl[0]),
		  
		  	.Sum				(Sum),
		  	.Cout				(Cout)          
  		);
  
  	// Create instance of And_for_N_bits
  	And_for_N_bits 	#(Width)	and_A_B
  		(
		  	.First				(A),
		  	.Second				(B),          
		  
		  	.Output				(Result_10)          
  		);
  
	// Create instance of Or_for_N_bits
  	Or_for_N_bits 	#(Width)	or_A_B
  		(
		  	.First				(A),
		  	.Second				(B),          
		  
		  	.Output				(Result_11)          
  		); 
  
	// Create instance of Mux_4_for_N_bits
  	Mux_4_for_N_bits #(Width)	mux_00_01_10_11_Results
  		(
		  	.First				(Sum),
		  	.Second				(Sum),
		  	.Third				(Result_10),          
		  	.Fourth				(Result_11),
		  
		  	.Switch				(ALUControl),
				   
		  	.Output				(Result)          
  		);
  
  	// Create instance of Not_N_bits_Then_Reduction_And  
  	// to connect Z (the Zero flag)
  	Not_N_bits_Then_Reduction_And	#(Width)	is_result_zero
  		(
		  	.Input			(Result),
		  
		  	.Output			(Z)
  		);
  
	// Assign N to Result's MSB 
  	// to connect N (the Negative flag)  
  	assign N = Result [Width - 1]											;
  
  	// Create not gate for ALUControl_1 to get
  	// output for C (Carry) and V (oVerflow)
   	not (not_ALUControl_1, ALUControl[1])									;
  
  	// Create and gate to connect C (the Carry flag) 	
  	and (C, not_ALUControl_1, Cout);
  
  	// Create xnor gate for A, B and Sum MSB
  	xnor (xnor_ALU0_Amsb_Bmsb, ALUControl[0], A[Width - 1], B[Width - 1])	;
  
  	// Create xor gate for A and Sum MSB
  	xor (xor_Amsb_Sum_msb, A[Width - 1], Sum[Width - 1])					;  
  

  	// Create and gate to connect V (the oVerflow flag) 	
  	and (V, xnor_ALU0_Amsb_Bmsb, xor_Amsb_Sum_msb, not_ALUControl_1)		;  
		
endmodule