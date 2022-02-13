module Checker(A,B,C,D,L);
input logic[3:0]A,B,C,D;
output logic L;
always_comb
begin
if(A>9)
L=1;
else if (B>5)
L=1;
else if (C>9)
L=1;
else if (D>5)
L=1;
else
L=0;
end
endmodule
