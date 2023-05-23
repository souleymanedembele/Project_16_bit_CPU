

module Project (
    KEY,
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
  input [1:0] KEY;
  
  output [17:0] LEDR;
  output [1:0] LEDG;
  
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


// Test ALU
//module Project (
//    SW,
//    LEDR,
//    HEX0,
//    HEX1,
//    HEX4,
//    HEX5,
//    HEX6,
//    HEX7
//);
//  input [17:0] SW;
//  output [17:0] LEDR;
//  output [0:6] HEX0, HEX1, HEX4, HEX5, HEX6, HEX7;
//
//  assign LEDR = SW;
//  wire [2:0] M0, M1, M4, M5, M6, M7;
//
//  assign M0 = SW[6:3];
//  assign M1 = SW[10:7];
//
//  ALU DUT (
//      .Sel(SW[2:0]),
//      .A  (M0),
//      .B  (M1),
//      .Q  ({M7, M6, M5, M4})
//  );
//
//  Decoder Decoder0 (
//      .C  (M0),
//      .Hex(HEX0)
//  );
//  Decoder Decoder1 (
//      .C  (M1),
//      .Hex(HEX1)
//  );
//  Decoder Decoder2 (
//      .C  (M4),
//      .Hex(HEX4)
//  );
//  Decoder Decoder3 (
//      .C  (M5),
//      .Hex(HEX5)
//  );
//  Decoder Decoder4 (
//      .C  (M6),
//      .Hex(HEX6)
//  );
//  Decoder Decoder5 (
//      .C  (M7),
//      .Hex(HEX7)
//  );
//endmodule

