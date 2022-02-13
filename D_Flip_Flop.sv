module D_Flip_flop(input logic clk,Mode,
  output logic Old_Mode);
  //This D flip flop stores the value of the old mode to know when the user changes the mode whether It is the same or not to know whether it is an error or not.
  always @(posedge clk) 
  begin
   Old_Mode <= Mode;
  end
endmodule

