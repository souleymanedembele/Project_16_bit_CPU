/**
 * File              : regFile16x16.sv
 * Author            : Souleymane Dembele <sdembele@uw.edu>
 * Date              : 05.18.2023
 * Last Modified Date: 05.18.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */

module regFile16x16 (
    clk,  // system clock
    write,  // write enable
    wrAddr,  // write address
    wrData,  // write data
    rdAddrA,  // A-side read address
    rdDataA,  // A-side read data
    rdAddrB,  // B-side read address
    rdDataB  // B-side read data
);
  input clk, write;
  input [3:0] wrAddr, rdAddrA, rdAddrB;
  input [15:0] wrData;
  output [15:0] rdDataA, rdDataB;

  reg [15:0] regFile[0:15];

  // read the registers
  assign rdDataA = regFile[rdAddrA];
  assign rdDataB = regFile[rdAddrB];

  // write to the registers
  always_ff @(posedge clk) begin
    if (write) begin
      regFile[wrAddr] <= wrData;
    end
  end
endmodule


module regFile16x16_tb ();
  reg clk, write;
  reg [3:0] wrAddr, rdAddrA, rdAddrB;
  reg [15:0] wrData;
  wire [15:0] rdDataA, rdDataB;

  regFile16x16 regFile16x16 (
      .clk(clk),
      .write(write),
      .wrAddr(wrAddr),
      .wrData(wrData),
      .rdAddrA(rdAddrA),
      .rdDataA(rdDataA),
      .rdAddrB(rdAddrB),
      .rdDataB(rdDataB)
  );

  always begin
    clk = 0;
    #10;
    clk = 1;
    #10;
  end

  initial begin
    wrAddr  = 0;
    wrData  = 0;
    rdAddrA = 0;
    rdAddrB = 0;
    #10;
    write  = 1;
    wrAddr = 1;
    wrData = 16'h1234;
    #10;
    rdAddrA = 1;
    rdAddrB = 1;
    #10;
    wrAddr = 2;
    wrData = 16'h5678;
    #10;
    rdAddrA = 2;
    rdAddrB = 2;
    #10;
    write  = 1;
    wrAddr = 3;
    wrData = 16'h9abc;
    #10;
    $stop;
  end

endmodule
