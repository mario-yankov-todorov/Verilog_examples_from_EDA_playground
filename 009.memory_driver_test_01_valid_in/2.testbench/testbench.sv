/*
*	M. Todorov 2021
*/

// Include the following files
`include "interface.sv"
`include "random_test.sv"

module tbench_top;
  
  	bit clk;
  	bit rst;
  
  	// Generate a clock
  	always #5 clk = ~clk;
  
  	// Reset Generation
  	initial begin
		rst = 1;
		#5
		rst = 0;
  	end
  
  	// Create instance of the interface
  	// in order to connect DUT and testcase
  	intf i_intf(clk,rst);
  
  	// Create testcase instance and pass the 
  	// interface handle as an argument
  	test t1(i_intf);
  
  	// Create DUT instance and connect
  	// interface signals to the DUT ports
  	valid_in DUT 
  	(
		.clk		(i_intf.clk),
		.rst		(i_intf.rst),
		.button		(i_intf.button),
		.valid_in	(i_intf.valid_in)
  	);
  
  	// Enable the wave dump
  	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
  	end
  
endmodule
  
  
  
	
	
	
	
	
	