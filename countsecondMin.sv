module countersecondMin(clk,set,select,sMin,secondMin,Signal);
input logic clk,set,select;
input logic[3:0]sMin;
output logic[3:0] secondMin;
output logic Signal;
always_ff@(posedge clk, posedge set)
begin
if(set & select)
begin
secondMin<=sMin;
Signal<=0;
end
else
begin
if(secondMin<5)
begin
secondMin<=secondMin+1;
Signal<=0;
end
if(secondMin==5)
begin
secondMin<=0;
Signal<=1;
end
end
end
endmodule
