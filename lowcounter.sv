
module lowcounter (clk,count,reset);
input logic clk,reset;
output logic [1:0] count;

always_ff@(posedge clk)
begin 
if (reset==1)
count<=0;
else 
count <= count +1;
end
endmodule
