class monitor;
  
  	// Create virtual interface handle
  	virtual intf vif;
  	
  	// Create mailbox handle
  	mailbox mon2scb;
  	
  	// Create constructor
  	function new(virtual intf vif, mailbox mon2scb);
  	  	// Get the interface
  	  	this.vif = vif;
  	  	// Get the mailbox handles from
  	  	// the environment
  	  	this.mon2scb = mon2scb;
  	endfunction
  	
  	// Create task to samples the interface
  	// signal and send the sample packet to
  	// the scoreboard
  	task main;
  	  	forever begin
  	  	  	transaction trans;
  	  	  	trans = new();
  	  	  	@(posedge vif.clk);
  	  	  		trans.valid_in = vif.valid_in;
  	  	  	@(posedge vif.clk);
  	  	  		trans.button = vif.button;
  	  	  	@(posedge vif.clk);
  	  	  		mon2scb.put(trans);
  	  	  		trans.display("[ Monitor ]");
  	  	end
  	endtask
  	
endclass