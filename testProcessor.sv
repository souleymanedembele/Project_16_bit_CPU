// TCES 330, Spring 2023
// Testbench  for the programmable processor

`timescale 1 ns / 1 ps
module testProcessor;

  logic        Clk;  // system clock
  logic        Reset;  // system reset
  logic [15:0] IR_Out;  // instruction register
  logic [ 6:0] PC_Out;  // program counter
  logic [3:0] State, NextState;  // state machine state, next state
  logic [15:0] ALU_A, ALU_B, ALU_Out;  // ALU inputs and output 

  Processor DUT (
      .Clk(Clk),
      .Reset(Reset),
      .IR_Out(IR_Out),
      .PC_Out(PC_Out),
      .State(State),
      .NextState(NextState),
      .ALU_A(ALU_A),
      .ALU_B(ALU_B),
      .ALU_Out(ALU_Out)
  );

  // generate 50 MHz clock
  always begin
    Clk = 0;
    #10;
    Clk = 1'b1;
    #10;
  end

  initial  // Test stimulus
    begin
      $display("\nBegin Simulation.");
      Reset = 0;  // reset for one clock
      @(posedge Clk) #30 Reset = 1;
      wait (IR_Out == 16'h5000);  // halt instruction
      $display("\nEnd of Simulation.\n");
      $stop;
    end

  initial begin
    $monitor(
        "Time is %0t : Reset = %b   PC_Out = %h   IR_Out = %h  State = %h  ALU A = %h  ALU B = %h ALU Out = %h ALU_s0=%b D_Addr=%h D_Wr=%h",
        $stime, Reset, PC_Out, IR_Out, State, ALU_A, ALU_B, ALU_Out, DUT.ALU_s0, DUT.D_Addr,
        DUT.D_Wr);

  end


endmodule




