// System Verilog program by Souleymane and Jot
// on 05/21/2023

module Datapath (
    Clock,
    D_Addr,
    D_Wr,
    RF_s,
    RF_W_Addr,
    RF_W_en,
    RF_Ra_Addr,
    RF_Rb_Addr,
    ALU_s0,
    ALU_inA,
    ALU_inB,
    ALU_out
);
  input Clock, RF_W_en, D_Wr;
  input [1:0] RF_s;
  input [2:0] ALU_s0;
  input [3:0] RF_Ra_Addr, RF_Rb_Addr, RF_W_Addr;
  input [7:0] D_Addr;

  output [15:0] ALU_inA, ALU_inB, ALU_out;

  wire [15:0] DMem_Q, ALU_Q, MUX_Q;

  DataMemory DMem (
      .address(D_Addr),
      .clock(Clock),
      .data(ALU_inA),
      .wren(D_Wr),
      .q(DMem_Q)
  );

  Mux2to1 MUX (
      .ALUQ(ALU_Q),  // ALU_Q
      .RFSelect(RF_s),
      .ReadData(DMem_Q),  // DMem_Q
      .WriteData(MUX_Q)  // MUX_Q
  );

  regFile16x16 RF (
      .clk(Clock),
      .write(RF_W_en),
      .wrAddr(RF_W_Addr),
      .wrData(MUX_Q),
      .rdAddrA(RF_Ra_Addr),
      .rdDataA(ALU_inA),
      .rdAddrB(RF_Rb_Addr),
      .rdDataB(ALU_inB)
  );

  ALU LogicUnit (
      .Sel(ALU_s0),
      .A  (ALU_inA),
      .B  (ALU_inB),
      .Q  (ALU_Q)
  );

endmodule

`timescale 1ns / 1ns
module Datapath_tb ();
  reg Clock, RF_W_en, D_Wr;
  reg [1:0] RF_s;
  reg [2:0] ALU_s0;
  reg [3:0] RF_Ra_Addr, RF_Rb_Addr, RF_W_Addr;
  reg [7:0] D_Addr;

  wire [15:0] ALU_inA, ALU_inB, ALU_out;

  Datapath DUT (
      .Clock(Clock),
      .D_Addr(D_Addr),
      .D_Wr(D_Wr),
      .RF_s(RF_s),
      .RF_W_Addr(RF_W_Addr),
      .RF_W_en(RF_W_en),
      .RF_Ra_Addr(RF_Ra_Addr),
      .RF_Rb_Addr(RF_Rb_Addr),
      .ALU_s0(ALU_s0),
      .ALU_inA(ALU_inA),
      .ALU_inB(ALU_inB),
      .ALU_out(ALU_out)
  );

  always begin
    Clock = 0;
    #10;
    Clock = 1;
    #10;
  end

  initial begin
    ALU_s0 = 3'h0;  // ALU selectbit to be 0
    RF_s = 2'b00;
    RF_W_en = 1;
    D_Wr = 1;
    RF_W_Addr = 4'h1;
    RF_Ra_Addr = 4'h1;
    RF_Rb_Addr = 4'h2;
    D_Addr = 8'h1;
    #200;
    ALU_s0 = 3'h0;  // ALU selectbit to be 0
    RF_s = 2'b01;
    RF_W_en = 1;
    D_Wr = 1;
    RF_W_Addr = 4'h1;
    RF_Ra_Addr = 4'h1;
    RF_Rb_Addr = 4'h2;
    D_Addr = 8'h1;
    #200;
    $stop;
  end

  initial begin
    $monitor("ALU_inA = %b, ALU_inB = %b, ALU_out = %b, MUX_Q=%b, MUX_SELECT=%b ", ALU_inA,
             ALU_inB, ALU_out, DUT.MUX_Q, RF_s);
  end
endmodule

