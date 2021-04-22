class scoreboard;
  	
  	// Create mailbox handle
  	mailbox mon2scb;
  	
  	 // Create a variable to count the
  	// number of transactions
  	int no_transactions;
  	
  	// Create constructor
  	function new (mailbox mon2scb);
  	  	// Get the mailbox handles from
  	  	// the environment
  	  	this.mon2scb = mon2scb;
  	endfunction
  	
  	// Create task to compare the actual
  	// result with the expected result
  	task main;
  	  	transaction trans;
  	  	forever begin
  	  	  	mon2scb.get(trans);
  	  	  	if(trans.valid_in == 0 && trans.button == 0)
  	  	  	  	$display
  	  	  	  	(
  	  	  	  	 	"Result as expected, both equal to 0 = : %0b",
  	  	  	  	 	 trans.valid_in, trans.button
  	  	  	  	);
  	  	  	else
  	  	  	  	$display
  	  	  	  	(
  	  	  	  	  	"Button is active : %0b, Valid %0b",
  	  	  	  	  	trans.button, trans.valid_in
  	  	  	  	);
  	  	  	no_transactions++;
  	  	  	trans.display("[ Scoreboard ]");     
  	  	end
  	endtask
  	
endclass