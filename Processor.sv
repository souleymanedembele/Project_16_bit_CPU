/**
* 6/1/23
* Jotkamal and Souleymane
* Processor.sv
*/

module Processor( Clk, Reset, IR_Out, PC_Out, State, NextState, ALU_A, ALU_B, ALU_Out);

	input Clk; // processor clock
	input Reset; // system reset
	output [15:0] IR_Out; // Instruction register
	output [7:0] PC_Out; // Program counter
	output [3:0] State; // FSM current state
	output [3:0] NextState; // FSM next state (or 0 if you don?t use one)
	output [15:0] ALU_A; // ALU A-Side Input
	output [15:0] ALU_B; // ALU B-Side Input
	output [15:0] ALU_Out; // ALU current output

	wire D_wr, RF_s, RF_W_en;
	wire [7:0] D_Addr;
	wire [6:0] PC_Out;
	wire [3:0] CurrentState, NextState, RF_Ra_Addr, RF_Rb_Addr, RF_W_Addr;
	wire [2:0] ALU_s0;
	
	Controller CU(.clk(clk),
		      .Rst(Reset),
		      .IR_Out(IR_Out),
		      .PC_Out(PC_Out),
    		      .OutState(CurrentState),
    		      .NextState(NextState),
    		      .D_Addr(D_Addr),
    		      .D_Wr(D_wr),
    		      .RF_s(RF_s),
    		      .RF_W_en(RF_W_en),
    		      .RF_Ra_Addr(RF_Ra_Addr),
    	              .RF_Rb_Addr(RF_Rb_Addr),
    		      .RF_W_Addr(RF_W_Addr),
    		      .ALU_s0(ALU_s0)
		      );

	Datapath DP(Clock(clk),
    		   .D_Addr(D_Adder)
                   .D_Wr(D_wr),
          	   .RF_s(RF_s),
    		   .RF_W_Addr(RF_W_Addr),
    		   .RF_W_en(RF_W_en),
    		   .RF_Ra_Addr(RF_Ra_Addr),
   	 	   .RF_Rb_Addr(RF_Rb_Addr),
    		   .ALU_s0(ALU_s0),
    		   .ALU_inA(ALU_A),
    		   .ALU_inB(ALU_B),
    		   .ALU_out(ALU_Out)
   		   );

endmodule
