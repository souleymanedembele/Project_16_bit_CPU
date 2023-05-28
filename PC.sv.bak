/**
* Jotkamal Jaswal
* 5/25/23
*/
module PC(Clk, Clr, Up, Addr);

	input Clk, Clr, Up;
	output reg [6:0] Addr;

	always @(posedge Clk) begin
		if (Clr)
			Addr <= 0;
		else if (Up)
			Addr <= Addr + 1;
	end

endmodule

module PC_tb();

	logic Clk, Clr, Up;
	logic [6:0] Addr;

	PC DUT(.Clk(Clk),
		   .Clr(Clr),
		   .Up(Up),
		   .Addr(Addr));

	always begin
		Clk = 0;
		#10;
		Clk = 1;
		#10;
	end

	initial begin
	Clr = 1; Up = 1; #30;
			 Up = 0; #30;

	$display("Clr: %d, Adder: %d", Clr, Addr);
	Clr = 0; Up = 1; #20;
	$display("Clr: %d, Adder: %d", Clr, Addr);
			 Up = 1; #20;
	$display("Clr: %d, Adder: %d", Clr, Addr);
			 Up = 1; #2590;
	$stop;
	end 
	
	initial begin	
	$monitor("Addr = %b", Addr); 
	end
	

endmodule
	