/**
 * File              : Controller.sv
 * Author            : Souleymane and Jot
 * Date              : 05.28.2023
 * Last Modified Date: 05.29.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */

module Controller (
    Clk,
    Rst,
    PC_Out,
    IR_Out,
    OutState,
    NextState,
    D_Addr,
    D_Wr,
    RF_s,
    RF_W_en,
    RF_Ra_Addr,
    RF_Rb_Addr,
    RF_W_Addr,
    ALU_s0
);
  input Clk, Rst;

  output [6:0] PC_Out;
  output [15:0] IR_Out;
  output [3:0] OutState, NextState;
  output [7:0] D_Addr;
  output D_Wr, RF_s, RF_W_en;
  output [3:0] RF_Ra_Addr, RF_Rb_Addr, RF_W_Addr;
  output [2:0] ALU_s0;

  wire [15:0] IMem_Q;
  wire IR_Ld, PCUp, PCClr;

  myROM IMem (
      .address(PC_Out),
      .clock(Clk),
      .q(IMem_Q)
  );

  PC ctr (
      .Clk (Clk),
      .Clr (PCClr),  // from state machine
      .Up  (PCUp),   // from ,,
      .Addr(PC_Out)
  );
  IR instrucReg (
      .Clock(Clk),
      .Ld(IR_Ld),  // from state machine
      .instruction(IMem_Q),
      .instructionOut(IR_Out)  // go to state machine
  );

  ControllerStateMachine FSM (
      .Clk(Clk),
      .Rst(Rst),
      .instruction(IR_Out),
      .ALUSelect(ALU_s0),
      .CurrentStateOut(OutState),
      .DAddr(D_Addr),
      .DWrite(D_Wr),
      .IRLd(IR_Ld),
      .NextStateOut(NextState),
      .PCClr(PCClr),
      .PCUp(PCUp),
      .RFAReadAddr(RF_Ra_Addr),
      .RFBReadAddr(RF_Rb_Addr),
      .RFSelect(RF_s),
      .RFWriteAddr(RF_W_Addr),
      .RFWriteEnable(RF_W_en)
  );

endmodule

`timescale 1ns / 1ns

module Controller_tb;
  reg Clk, Rst;

  wire [ 6:0] PC_Out;
  wire [15:0] IR_Out;
  wire [3:0] OutState, NextState;
  wire [7:0] D_Addr;
  wire D_Wr, RF_s, RF_W_en;
  wire [3:0] RF_Ra_Addr, RF_Rb_Addr, RF_W_Addr;
  wire [2:0] ALU_s0;
  Controller CU (
      .Clk(Clk),
      .Rst(Rst),
      .PC_Out(PC_Out),
      .IR_Out(IR_Out),
      .OutState(OutState),
      .NextState(NextState),
      .D_Addr(D_Addr),
      .D_Wr(D_Wr),
      .RF_s(RF_s),
      .RF_W_en(RF_W_en),
      .RF_Ra_Addr(RF_Ra_Addr),
      .RF_Rb_Addr(RF_Rb_Addr),
      .RF_W_Addr(RF_W_Addr),
      .ALU_s0(ALU_s0)
  );

  always begin
    Clk = 0;
    #10;
    Clk = 1;
    #10;
  end

  initial begin
    Rst = 1;
    #20;
    Rst = 0;
    #500;
    $stop;
  end

  initial begin
    $monitor($time,,, "IMem_Q = %b, PC_Out=%b", CU.IMem_Q, PC_Out);
  end
endmodule
