module Counter0to9(clk,sign); 
//This Counter count from 0 to 9 and give signal if counter=3 or 6 or 9
input logic clk;
output logic sign;
logic[3:0]Counter=0;
always_ff@(posedge clk)
if(clk) Counter<=Counter+1;
always_comb
begin
 if(Counter==3 |Counter==6 |Counter==9)
sign=1;
else
 sign=0;
end
endmodule
