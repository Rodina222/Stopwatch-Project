//This module represent Multiplixer with 7 bit input 
module MUX7b(C0,C1,S,Output); // C1 represent errors part in our design , C0 is counters 
input logic[7:0]C1,C0;
input logic S;
output logic[7:0]Output;
always_comb
begin
if(S)
Output=C1;
else
Output=C0;
end
endmodule
