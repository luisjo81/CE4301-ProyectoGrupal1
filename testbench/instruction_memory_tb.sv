`timescale 1 ps / 1 ps
module instruction_memory_tb;


logic	[7:0]  address;
logic clk, start;
logic	[31:0]  q;

instruction_memory DUT (.address(address), .clock(clk), .rden(start), .q(q));


initial begin

		clk = 0;
		start = 1;
		address = 8'b0;
		
		$display("begining of test");
	
		
		for (int i = 0; i < 15; i++) 
		begin
			
			$display("instruction = %0d -->> %b from the address %b", i, q, address);
			address = address + 1;
			#10;
		end
		
//		assert (value_q == value_d) $display("First register test is acomplished");
//		else $error ("First register test error"); 

end

always #5 clk <= !clk;

endmodule
