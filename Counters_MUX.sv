module Counters_MUX (input logic [3:0] a1,//the 1st 4 bits as an input.
  input logic [3:0] a2,//the 2nd 4 bits as an input.
  input logic [3:0] a3,//the 3rd 4 bits as an input.
  input logic [3:0] a4,//the 4th 4 bits as an input.
  input logic [1:0]s,// the selector
  output logic [3:0]y);// the output
  //This mux is used to choose a counter as an input via the selector.
 
always_comb
begin
case(s)
 2'b00: y=a1; //a1 represents the 1st counter (for seconds).
 2'b01: y=a2;//a2 represents the 2nd counter (for seconds).
 2'b10: y=a3;//a3 represents the 3rd counter (for minutes).
 2'b11: y=a4; //a4 represents the 4th counter (for minutes).
 default:y=a1;
 endcase
 end
 endmodule
