/**
 * File              : Project.sv
 * Author            : Souleymane Dembele <sdembele@uw.edu> and Jot
 * Date              : 06.01.2023
 * Last Modified Date: 06.01.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */


module Project (
    KEY,
    CLOCK_50,
    SW,
    LEDR,
    LEDG,
    HEX0,
    HEX1,
    HEX2,
    HEX3,
    HEX4,
    HEX5,
    HEX6,
    HEX7
);
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;

  output [17:0] LEDR;
  output [3:0] LEDG;

  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  assign LEDR = SW;
  assign LEDG = KEY;

  wire [2:0] M0, M1, M2, M3, M4, M5, M6, M7;
  wire ButtonOut, FilterOut, Strobe;
  wire [15:0] ALU_A, ALU_B, ALU_Out, IR_Out, Mux8t1Nw_Out;
  wire [7:0] NextStateOut, PC_Out, StateOut;

  // ButtonSyncReg: BS
  ButtonSyncReg BS (
   CLOCK_50,
   KEY[2],
   ButtonOut
  );
  // KeyFilter:Filter
  KeyFilter Filter (
      .Clock(CLOCK_50),
      .In(ButtonOut),
      .Out(FilterOut),
      .Strobe(Strobe)
  );
  // Processor: Proc
  Processor Proc (
      .Clk(FilterOut),
      .Reset(KEY[1]),
      .IR_Out(IR_Out),
      .PC_Out(PC_Out),
      .State(StateOut),
      .NextState(NextStateOut),
      .ALU_A(ALU_A),
      .ALU_B(ALU_B),
      .ALU_Out(ALU_Out)
  );
  // Mux8t1Nway: Mx
  Mux_Nw_8_to_1 #(
      .N(16)
  ) Mux_Nw_8_to_1 (
      .S(SW[2:0]),
      .A({PC_Out, State_Out}),
      .B(ALU_A),
      .C(ALU_B),
      .D(ALU_Out),
      .E({7'h0, NextStateOut}),
      .F(16'h0),
      .G(16'h0),
      .H(16'h0),
      .M(Mux8t1Nw_Out)
  );
  assign M4 = Mux8t1Nw_Out[3:0];
  assign M5 = Mux8t1Nw_Out[7:4];
  assign M6 = Mux8t1Nw_Out[11:8];
  assign M7 = Mux8t1Nw_Out[15:12];
  
  assign M0 = IR_Out[3:0];
  assign M1 = IR_Out[7:4];
  assign M2 = IR_Out[11:8];
  assign M3 = IR_Out[15:12];

  Decoder Decoder0 (
      .C  (M0),
      .Hex(HEX0)
  );
  Decoder Decoder1 (
      .C  (M1),
      .Hex(HEX1)
  );
  Decoder Decoder2 (
      .C  (M2),
      .Hex(HEX2)
  );
  Decoder Decoder3 (
      .C  (M3),
      .Hex(HEX3)
  );
  Decoder Decoder4 (
      .C  (M4),
      .Hex(HEX4)
  );
  Decoder Decoder5 (
      .C  (M5),
      .Hex(HEX5)
  );
  Decoder Decoder6 (
      .C  (M6),
      .Hex(HEX6)
  );
  Decoder Decoder7 (
      .C  (M7),
      .Hex(HEX7)
  );
endmodule
