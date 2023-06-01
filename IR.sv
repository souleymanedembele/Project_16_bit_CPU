/**
 * File              : IR.sv
 * Author            : Souleymane Dembele <sdembele@uw.edu> and Jot
 * Date              : 05.28.2023
 * Last Modified Date: 05.30.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */

module IR (
    Clock,
    Ld,
    instruction,
    instructionOut
);
  input Clock, Ld;
  input [15:0] instruction;
  output [15:0] instructionOut;
  reg [15:0] instructionOut;
  always_ff @(posedge Clock) begin
    if (Ld) begin
      instructionOut <= instruction;
    end
  end
endmodule

module IR_tb;
  reg Clock, Ld;
  reg  [15:0] instruction;
  wire [15:0] instructionOut;

  IR instrucReg (
      .Clock(Clock),
      .Ld(Ld),
      .instruction(instruction),
      .instructionOut(instructionOut)
  );

  always begin
    Clock = 0;
    #10;
    Clock = 1;
    #10;
  end

  initial begin
    Ld = 0;
    instruction = 16'h1234;
    #40;
    Ld = 1;
    #40;
    instruction = 16'h0001;
    #40;
    $stop;
  end

  initial begin
    $monitor($time,,,, "Ld = %b, instruction = %b, instructionOut = %b", Ld, instruction,
             instructionOut);
  end
endmodule
