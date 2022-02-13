module CounterfirstMin(clk,set,select,Min,firstMin,Signal);
input logic clk,set,select;
input logic[3:0]Min;
output logic[3:0] firstMin;
output logic Signal;
always_ff@(posedge clk, posedge set)
begin
if(set & select)
begin
firstMin<=Min;
Signal<=0;
end
else
begin
if(firstMin<9)
begin
firstMin<=firstMin+1;
Signal<=0;
end
if(firstMin==9)
begin
firstMin<=0;
Signal<=1;
end
end
end
endmodule