module ANDgate(S1,S0,Output);
input logic S1,S0;
output logic Output;
always_comb
begin
if(S1&S0)
Output=1;
else
Output=0;
end
endmodule
