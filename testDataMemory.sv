/**
 * File              : testDataMemory.sv
 * Author            : Souleymane Dembele <sdembele@uw.edu>
 * Date              : 05.21.2023
 * Last Modified Date: 05.21.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */
// Testing the DataMemory module 
// with size 256 and 16 bits per word
`timescale 1ns / 1ns
module testDataMemory ();
  logic Clk;
  logic [15:0] Addr;
  logic [15:0] Q;
  logic [15:0] wrData;
  logic wrEn;

  DataMemory test1 (
      .address(Addr),
      .clock(Clk),
      .data(wrData),
      .wren(wrEn),
      .q(Q)
  );

  always begin
    Clk = 0;
    #10;
    Clk = 1;
    #10;
  end

  initial begin
    @(negedge Clk) Addr = 76;
    wrData = 16'hA;
    wrEn   = 1;
    $display("Addr = %d, wrData = %h, wrEn = %d, Q = %h", Addr, wrData, wrEn, Q);
    @(posedge Clk) #2;
    $display("Addr = %d, wrData = %h, wrEn = %d, Q = %h", Addr, wrData, wrEn, Q);
    @(negedge Clk) wrData = 16'hB;
    $display("Addr = %d, wrData = %h, wrEn = %d, Q = %h", Addr, wrData, wrEn, Q);
    @(posedge Clk) #2;
    $display("Addr = %d, wrData = %h, wrEn = %d, Q = %h", Addr, wrData, wrEn, Q);
    #66;
    $stop;
  end
endmodule
