// This module is a tristate buffer output=input when Enable =1 otherwise Output=0
module tristateB(A,E,O);  //A represent input E : enable O Output 
input logic[3:0]A;
input logic E;
output logic [3:0]O;
always_comb
begin 
if(E)
O=A;
if(!E)
O=0;
end
endmodule
