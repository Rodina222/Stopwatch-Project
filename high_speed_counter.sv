module high_speed_counter (input logic clk,
   input logic reset,
  output logic [1:0] out);
  //this is the counter connected with the multiplexer of errors and the multiplexers of errors it has high speed to toggle btween the bits of each multiplexer fast.
  
  always_ff @ (posedge clk,posedge reset)
begin
  if(reset) out <= 0;
  else if (out < 3) out <= out+1;
  else if (out == 3) out<=0;
 end   
  endmodule
  
  
