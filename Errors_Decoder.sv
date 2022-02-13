module Errors_Decoder (input logic [3:0] data,
  output logic [7:0] segmentsout);//a,b,c,d,e,f,g,dp(Name of segments)
  //It represents the seven segment decoder used to display the errors and saver mode on the display.
  logic[7:0] segments;
  always_comb
  begin
  case(data)
    //saver mode where each segments flashes at a time
    4'b0000: segments=8'b00000010;
    4'b0001: segments=8'b00000100;
    4'b0010: segments=8'b00001000;
    4'b0011: segments=8'b00010000;
    4'b0100: segments=8'b00100000;
    4'b0101: segments=8'b01000000;
    4'b0110: segments=8'b10000000;
    //Errors
    4'b0111: segments=8'b10011100;// [ part of error
    4'b1000: segments=8'b11110000;// ] part of error
    4'b1001: segments=8'b10110110;// 5 part of error
    4'b1010: segments=8'b11110110;// 9 part of error
    4'b1011: segments=8'b00000010;// - part of error
    4'b1100: segments=8'b10011110;// E part of error
    4'b1101: segments=8'b11111100;// 0 part of error
    4'b1110: segments=8'b01100000;// 1 part of error
    4'b1111: segments=8'b10011100;// C part of error  
    default: segments=8'b00000000; 
 endcase
 end
 assign segmentsout=~segments;
 endmodule

