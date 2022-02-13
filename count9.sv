module count9 (clk,reset,mode,start,set,clk2,counter,value,legal,oldmode,sel_Stopwatch_Watch);
input logic clk,reset,start,mode,set,legal,oldmode,sel_Stopwatch_Watch;
input logic [3:0]value;
output logic clk2;
output logic[3:0]counter;
always_ff@(posedge clk,posedge reset,posedge set)
begin
if (start==1 |(set==1 & legal==1) &(mode==oldmode))
begin
if(reset == 1)
begin
clk2 <=0;
if (mode ==1)  counter <= 0;
else if (mode==0) counter <= 9;
end
else
begin
if(mode == 1)
begin
if(counter <9)
begin
counter <= counter + 1;
clk2 <= 0;
end
if (counter == 9)
begin
clk2<= 1;
counter <=0;
end
end
else if (mode == 0)
begin
if (counter>0)
begin
counter <= counter - 1;
clk2 <=0;
end
else if (counter == 0)
begin
clk2 <=1;
counter <=9;
end
end
end
end
if((start==1) & (mode!=oldmode))
begin
counter<=counter;
clk2<=0;
end
if(set==1 & legal==0 & sel_Stopwatch_Watch==0)
begin
if (mode == 0)
begin
counter <= value;
clk2<=0;
end
if(mode == 1)
begin
if(counter <9)
begin
counter <= counter;
clk2 <= 0;
end
if (counter == 9)
begin
clk2<= 1;
counter <=9;
end
end
end
end
endmodule