module ALU_tb;
  
	parameter N = 4;
  
  	reg 	[N		-1:0] 	A;
	reg 	[N		-1:0] 	B;
  	reg 	[2		-1:0] 	alu_control;
 	 
  	wire 	[2		-1:0] 	result;
  
	integer i;
  
	ALU uut
  		(
		 	.A				(A), 
		  	.B				(B), 
		   	.result			(result),
   			.alu_control	(alu_control)
   		);
  
	initial begin
	  
		{A, B,alu_control } = 0;
	  
	  	$monitor 
	  	(
		  	"%t\|  A = %0d   B = %0d   result = %0d   alu_control = %0b", 
		  	$time, A, B, result, alu_control
		);
	 
		for (i = 0; i < 4; i = i+1) begin
	  
	   	 	#100; 
	   	 	A = 2'b10;
		 	B = 2'b01;
	   	 	alu_control = 2'b01;
	   	 	
	   	 	#100; 
	   	 	A = 2'b10;
		 	B = 2'b01;
	   	 	alu_control = 2'b11;
	   	 	
	   	 	#100; 
	   	 	A = 2'b10;
		 	B = 2'b01;
	   	 	alu_control = 2'b10;
	   	
		   	#100;
	   	 	A = 2'b10;
	   	 	B = 2'b01;
	   	 	alu_control = 2'b00;
	  
		end
	  
	end

	initial begin 
	  
		$dumpfile("dump.vcd"); $dumpvars;
 
 	end
  
endmodule
