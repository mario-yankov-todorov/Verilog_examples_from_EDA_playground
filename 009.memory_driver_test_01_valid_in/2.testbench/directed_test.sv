`include "environment.sv"

program test(intf i_intf);
  
  	class my_trans extends transaction;
  	  
  	  	bit [2	-1:0] count;
  	  	
  	  	function void pre_randomize();
  	  	  
  	  	  	button.rand_mode(0);      
  	  	  	button = 1;
  	  	  
  	  	endfunction
  		  
  	endclass
  
  	// Declare environment instance
  	environment env;
  	my_trans my_tr;
  	
  	initial begin
  	  
  	  	// Create environment
  	  	env = new(i_intf);
  	  	
  	  	my_tr = new();
  	  	
  	  	// Set the repeat count of 
  	  	// generator
  	  	env.gen.repeat_count = 10;
  	  	
  	  	env.gen.trans = my_tr;
  	  	
  	  	// Call run of env
  	  	env.run();
  	  
  	end 
  
endprogram