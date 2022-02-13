module Counters_Decoder (input logic [3:0] data,
  output logic [7:0] segmentsout);//a,b,c,d,e,f,g,dp(Name of segments)
  //It represents the seven segment decoder used to display the digits on the screen.
  logic [7:0] segments;
  always_comb
  begin
  case(data)
    4'b0000: segments=8'b11111100;// 0
    4'b0001: segments=8'b01100000;// 1
    4'b0010: segments=8'b11011010;// 2
    4'b0011: segments=8'b11110010;// 3
    4'b0100: segments=8'b01100110;// 4
    4'b0101: segments=8'b10110110;// 5
    4'b0110: segments=8'b10111110;// 6
    4'b0111: segments=8'b11100000;// 7
    4'b1000: segments=8'b11111110;// 8
    4'b1001: segments=8'b11110110;// 9 
    default: segments=8'b00000000; 
 endcase
 end
 assign segmentsout=~segments;
 endmodule
