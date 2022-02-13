module count5 (clk,reset,mode,start,set,clk2,counter,value,legal,sel_Stopwatch_Watch);
input logic reset,start,mode,set,legal,clk,sel_Stopwatch_Watch;
input logic [3:0]value;
output logic clk2;
output logic[3:0]counter;
always_ff@(posedge clk,posedge reset,posedge set)
begin
if (start==1 |(set==1 & legal==1))
begin
if(reset == 1)
begin
clk2 <=0;
if (mode ==1)  counter <= 0;
else if (mode==0) counter <= 5;
end
else
begin
if(mode == 1)
begin
if(counter <5)
begin
counter <= counter + 1;
clk2 <= 0;
end
if (counter == 5)
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
counter <=5;
end
end
end
end
if(set==1 & legal==0&sel_Stopwatch_Watch==0)
begin
if (mode == 0)
begin
counter <= value;
clk2<=1;
end
if(mode == 1)
begin
if(counter <5)
begin
counter <= counter + 1;
clk2 <= 0;
end
if (counter == 5)
begin
clk2<= 1;
counter <=0;
end
end
end
end
endmodule
