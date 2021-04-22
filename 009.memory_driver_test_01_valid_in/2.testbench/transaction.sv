class transaction;
  
  	// Declare the transaction items
  	rand 	bit 					button;
  			bit		[8     -1:0] 	valid_in;
  
  	function void display(string name);
		$display("---------------------------");
		$display("- %s ", name);
		$display("---------------------------");
		$display("- button 	  = %0b", button  );
		$display("- valid_in  = %0b", valid_in);
		$display("---------------------------");
  	endfunction
	
endclass