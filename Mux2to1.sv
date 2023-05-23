/**
* Jotkamal Jaswal
* 5/18/23
* Mux2to1
*/

module Mux2to1(ALUQ, RFSelect, ReadData, WriteData);
    
    input [15:0] ALUQ;
    input [1:0] RFSelect;
    input [15:0] ReadData;
    output reg [15:0] WriteData;
    
    always @(ALUQ, ReadData, RFSelect, WriteData)
		case(RFSelect)
	0: WriteData = ALUQ;
	1: WriteData = ReadData;
	endcase

endmodule 
 
module Mux2to1_tb;

    logic [15:0] ALUQ;
    logic [1:0] RFSelect;
    logic [15:0] ReadData;
    logic [15:0] WriteData;
   


    Mux2to1 DUT (.ALUQ(ALUQ),
	     .RFSelect(RFSelect),
	     .ReadData(ReadData),
	     .WriteData(WriteData));

    initial begin
	for (int k = 0; k < 16; k++) begin
		ALUQ = k;
		for (int j = 0; j < 16; j++) begin
			ReadData = j;
			for (int i = 0; i < 2; i++) begin 
				RFSelect = i;
				#10;
			end
		end
	end
	end
	
	initial 
	$monitor("ALUQ = %d",ALUQ,,, "RFSelect = %b", RFSelect,,,"ReadData = %b", ReadData ,,,"WriteData = %d", WriteData);

endmodule


