module Register (clk,enable,in,Num);
input logic clk,enable;
input logic [0:3] in;
output  logic [0:3] Num;
  // A represents the 1st digit in seconds given by the user.
  
  always_ff @ (posedge clk)
  if (enable) Num <= in;
    
endmodule
