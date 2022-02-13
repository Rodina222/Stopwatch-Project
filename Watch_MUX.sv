module Watch_MUX (Min1,Min2,Hour1,Hour2,S,Out); // Min1,Min2,Hour1,Hour2
input logic[3:0]Min1,Min2,Hour1,Hour2;  
input logic[1:0]S; // S is the selector signal from the high speed counter
output logic [3:0]Out;
always_comb
case(S)
00:Out=Min1;
01:Out=Min2;
10:Out=Hour1;
11:Out=Hour2;
endcase

endmodule
