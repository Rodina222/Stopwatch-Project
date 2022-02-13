module counthalfsec (clk,reset,clk2);
input logic clk,reset;
output logic clk2;
logic[8:0] count;

always_ff@(posedge clk,posedge reset)
begin 
if (reset==1)
begin
count <= 0;
clk2 <=0;
end
else if(count < 12.5 )
begin
count <= count + 1;
clk2 <=0;
end
else if (count >12.5 & count<25)
begin
clk2 <= 1;
count <= count + 1;
end
else if(count==25)
count<=0;
end
endmodule
