class driver;
  
  	// Create a variable to count the
  	// number of transactions
  	int no_transactions;
  	
  	// Create virtual interface handle 
  	virtual intf vif;
  	
  	// Create mailbox handle
  	mailbox gen2driv;
  	
  	// Create constructor
  	function new(virtual intf vif, mailbox gen2driv);
  		// Get the interface
  	  	this.vif = vif;
  		// Get the mailbox handles from
  	  	// the environment
  	  	this.gen2driv = gen2driv;
  	endfunction
  	
  	// Create task for reset the interface
  	// signals to default / initial values
  	task rst;
  	  	wait(vif.rst);
  	  	$display("[ DRIVER ] ----- Reset Started -----");
  	  	vif.valid_in <= 0;
  	  	wait(!vif.rst);
  	  	$display("[ DRIVER ] ----- Reset Ended -----");
  	endtask
  
  // Create task to drivers the transaction
  // items to interface signals
  	task main;
  	  	forever begin
  	  	  	transaction trans;
  	  	  	gen2driv.get(trans);
  	  	  	@(posedge vif.clk);
  	  	  		wait(!vif.rst);
  	  	  		vif.button <= 1;
  	  	  		vif.button  = trans.button;
  	  	  	@(posedge vif.clk);
  	  	  		vif.button <= 1;
  	  	  	@(posedge vif.clk);
  	  	  		vif.button <= 0;
  	  	  	trans.display("[ Driver ]");
  	  	  	no_transactions++;
  	  	end
  	endtask
	
endclass