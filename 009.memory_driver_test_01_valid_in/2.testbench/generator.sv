class generator;
  
  	// Declare the transaction class
  	rand transaction trans;
  	
  	// Create repeat count to specify number
  	// of items to generate
  	int repeat_count;
  	   
  	// Declare mailbox to generate and send
  	// the packet to the driver
  	mailbox gen2driv;
  	
  	// Create event to indicate the end of
  	// the transaction generation
  	event ended;
  	
  	// Create constructor
  	function new(mailbox gen2driv);
  	  	this.gen2driv = gen2driv;
  	endfunction
  	
  	
  	// Create main task. The main task generates
  	// (creates and randomizes) the repeat_count
  	// number of transaction packets and puts 
  	// into mailbox
  	task main();
		repeat(repeat_count) begin
   			trans = new();
	  		if( !trans.randomize () ) $fatal("Gen:: trans randomization failed");
	  		trans.display("[ Generator ]");
	  		gen2driv.put(trans); // Transition
		end
   		-> ended; // Triggering indicates the end of generation
  	endtask 
  
endclass