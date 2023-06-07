/**
*Jotkamal Jaswal
* 5/18/23
* ALU
*/

//This module is the ALU and it used to do arithmetic operations
module ALU (
    A,
    B,
    Sel,
    Q
);

  input [2:0] Sel;
  input [15:0] A, B;

  output reg [15:0] Q;

  always @(Sel, A, B)
    case (Sel)
      0: Q = 16'h0;
      1: Q = A + B;
      2: Q = A - B;
      3: Q = A;
      4: Q = A ^ B;
      5: Q = A | B;
      6: Q = A & B;
      7: Q = A + 1;
    endcase

endmodule

//This is the testbench for the ALU
module ALU_tb ();

  logic [2:0] Sel;
  logic [15:0] A, B;
  logic [15:0] Q;

  ALU DUT (
      .Sel(Sel),
      .A  (A),
      .B  (B),
      .Q  (Q)
  );


  initial begin
    for (int k = 0; k < 16; k++) A = k;
    for (int j = 0; j < 16; j++) begin
      B = j;
      for (int i = 0; i < 16; i++) begin
        Sel = i;
        #10;
      end
    end
  end

  initial
    $monitor(
        "Select signal = %d", Sel,,, "Input A = %b", A,,, "Input B = %b", B,,, "Output = %d", Q
    );
endmodule



