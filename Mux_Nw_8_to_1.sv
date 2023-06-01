/**
 * File              : Mux_Nw_8_to_1.sv
 * Author            : Souleymane Dembele <sdembele@uw.edu>
 * Date              : 04.22.2023
 * Last Modified Date: 06.01.2023
 * Last Modified By  : Souleymane Dembele <sdembele@uw.edu>
 */
// This is a 3-bit wide 8-to-1 multiplexer
// It has 8 inputs and 1 output
module Mux_Nw_8_to_1 (
    S,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    M
);
  parameter N = 16;
  input [2:0] S;
  input [N-1:0] A, B, C, D, E, F, G, H;
  output reg [N-1:0] M;

  always @(S, A, B, C, D, E, F, G, H)
    case (S)
      3'b000: M = A;
      3'b001: M = B;
      3'b010: M = C;
      3'b011: M = D;
      3'b100: M = E;
      3'b101: M = F;
      3'b110: M = G;
      3'b111: M = H;
    endcase
endmodule

// Testbench for Mux_Nw_8_to_1
module Mux_Nw_8_to_1_tb ();
  parameter N = 16;
  reg [2:0] S;
  reg [N-1:0] A, B, C, D, E, F, G, H;
  wire [N-1:0] M;

  Mux_Nw_8_to_1 #(
      .N(N)
  ) Mux_Nw_8_to_1 (
      .S(S),
      .A(A),
      .B(B),
      .C(C),
      .D(D),
      .E(E),
      .F(F),
      .G(G),
      .H(H),
      .M(M)
  );
  // since it is a combinational circuit, we don't need a clock
  initial begin
    // I used a for loop to test all the possible combinations of inputs
    // and the output is displayed in the console and waveform as well
    // I used k < 8 because there are 8 possible combinations of 3 bits
    // and since we want to make sure that we if s == 3'b000, then M = A and so on
    // I verified that by looking at the console
    for (int k = 0; k < 16; k = k + 1) begin
      S = k;
      A = 3'b000;
      B = 3'b001;
      C = 3'b010;
      D = 3'b011;
      E = 3'b100;
      F = 3'b101;
      G = 3'b110;
      H = 3'b111;
      #10;
      assert (M == S) $display("Test %d passed", k);
      else $error("Mux_Nw_8_to_1 failed");
    end
  end
  initial begin
    $monitor("S = %b, A = %b, B = %b, C = %b, D = %b, E = %b, F = %b, G = %b, H = %b, M = %b", S,
             A, B, C, D, E, F, G, H, M);
  end
endmodule
