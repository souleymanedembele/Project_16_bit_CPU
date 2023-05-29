/**
* Jotkamal Jaswal
* 5/28/23
* testing the ROM
*/

`timescale 1ns / 1ns
module testInstructionMemory ();

  logic Clk;
  logic [6:0] Addr;
  logic [15:0] Q;


  myROM test0 (
      .address(Addr),
      .clock(Clk),
      .q(Q)
  );

  always begin
    Clk = 0;
    #10;
    Clk = 1;
    #10;
  end

  initial begin
    @(posedge Clk) Addr = 1;
    @(posedge Clk) #2;
    $display("The data read at address %d is %d", Addr, Q);
    @(posedge Clk) #2;
    $display("The data read at address %d is %d", Addr, Q);
    #66;
    $stop;
  end

endmodule

