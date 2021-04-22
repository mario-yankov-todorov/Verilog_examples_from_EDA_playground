`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  	// Declare instances of environment
  	// elements
  	generator 	gen;
  	driver  	driv;
  	monitor		mon;
  	scoreboard	scb;
  	
  	// Declare mailbox handle's
  	mailbox 	gen2driv;
  	mailbox		mon2scb;
  	
  	// Create virtual interface
  	virtual intf vif;
  	
  	// Create constructor
  	function new(virtual intf vif);
  	  
  	  	// Get the interface from the test
  	  	this.vif = vif;
  	  	
  	  	// Create the mailbox (same handle
  	  	// will be shared across generator
  	  	// and driver (monitor and scoreboard))
  	  	gen2driv	= new();
  	  	mon2scb		= new();
  	  	
  	  	// Create generator, driver, monitor 
  	  	// and scoreboard
  	  	gen		= new(gen2driv);
  	  	driv	= new(vif, gen2driv);
  	  	mon		= new(vif, mon2scb);
  	  	scb		= new(mon2scb);
  	  	
  	endfunction
  	
  	task	pre_test();
  	  	driv.rst();
  	endtask
  	
  	task test();
  	  	fork
  	  	  	gen.main();
  	  	  	driv.main();
  	  	  	mon.main();
  	  	  	scb.main();
  	  	join_any
  	endtask
  	
  	task post_test();
  	  	wait(gen.ended.triggered);
  	  	wait(gen.repeat_count == driv.no_transactions);
  	  	wait(gen.repeat_count == scb.no_transactions);
  	endtask
  	
  	// Create a task to run the tests
  	// written above
  	task run;
  	  	pre_test();
  	  	test();
  	  	post_test();
  	  	$finish;
  	endtask
  
endclass