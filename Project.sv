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
  input [17:0] SW;
  input [3:0] KEY;

  output [17:0] LEDR;
  output [3:0] LEDG;

  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  assign LEDR = SW;
  assign LEDG = KEY;

  wire [2:0] M0, M1, M2, M3, M4, M5, M6, M7;

  regFile16x16 DUT (
      .clk(KEY[0]),
      .write(KEY[1]),
      .wrAddr(SW[9:6]),
      .wrData(SW[5:0]),
      .rdAddrA(SW[13:10]),
      .rdDataA({M3, M2, M1, M0}),
      .rdAddrB(SW[17:14]),
      .rdDataB({M7, M6, M5, M4})
  );

  // Processor

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
