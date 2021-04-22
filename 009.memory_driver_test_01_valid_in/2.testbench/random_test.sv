/*
*	M. Todorov 2021
*/

`include "environment.sv"
program test(intf i_intf);
  
  	// Declare environment instance
  	environment env;
  	
  	initial begin
  	  
  	  	// Create environment
  	  	env = new(i_intf);
  	  	
  	  	// Set the repeat count of 
  	  	// generator as 4 means to
  	  	// generate 4 packets
  	  	env.gen.repeat_count = 4;
  	  	
  	  	// Call run of env
  	  	env.run();
  	  
  	end
  
endprogram