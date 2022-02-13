module counter3halfs (clk,reset,clk2);
input logic clk,reset;
output logic clk2;
int count;
always_ff@(posedge clk)
begin 
if (reset==1)
begin
count <= 0;
clk2 <=0;
end
else if(count < 4 )
begin
count <= count + 1;
clk2 <=0;
end
else if (count ==4)
begin
clk2 <= 1;
count<=0;
end
end
endmodule