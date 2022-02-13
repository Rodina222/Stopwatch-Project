module deMUX(S,A,D3,D2,D1,D0); //This module is describing demultiplexer
input logic A;     //demultiplexer input
input logic[1:0]S;     //demultiplexer selectors 
output logic D3,D2,D1,D0;   // demultiplexer output
always_comb
begin
if(!A)
begin
D3=0;
D2=0;
D1=0;
D0=0;
end
else if(A)
begin
if(S==0)
begin
D3=0;
D2=0;
D1=0;
D0=1;
end
if(S==1)
begin
D3=0;
D2=0;
D1=1;
D0=0;
end
if(S==2)
begin
D3=0;
D2=1;
D1=0;
D0=0;
end
if(S==3)
begin
D3=1;
D2=0;
D1=0;
D0=0;
end
end
end
endmodule
