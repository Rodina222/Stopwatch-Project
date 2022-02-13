module count30sec (clk,reset,clk2,start,set);
input logic clk,reset,start,set;
output logic clk2;
int count;
always_ff@(posedge clk,posedge reset)
begin 
if(start==1)
begin
if (reset==1)
begin
count <= 0;
clk2 <=0;
end
end
if (start==0)
begin
if (reset==1)
begin
count <= 0;
clk2 <=0;
end
if (set==1)
begin
count <= 0;
clk2 <=0;
end
if(set==0)
begin
if(count >= 30 )
begin
count <= count;
clk2 <=1;
end
else if (count <30)
begin
clk2 <= 0;
count<=count+1;
end
end
end
end
endmodule
