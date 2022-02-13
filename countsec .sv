
module countsec (clk,reset,clk2);
input logic clk,reset;
output logic clk2;
logic[25:0] count;
parameter frequency =25 ;

always_ff@(posedge clk,posedge reset)
if (reset==1 | count==50) count <= 0;
else  count<=count+1;
always_comb
begin
if(count < frequency )
clk2 =0;
else if (count >frequency)
clk2 = 1;
end
endmodule

