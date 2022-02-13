module Segment_Saver_Counter (input logic clk,
   input logic reset,
  output logic [3:0] out);
  //this is the counter responsible for the segment saver where it counts from 0 to 6 where each number represents one segment of the 7 segments of the display.  
  always_ff @ (posedge clk,posedge reset)
  if(reset) out <= 0;
  else if (out < 6) out <= out+1;
  else if (out >= 6) out=0;
    
  endmodule
