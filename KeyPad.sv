module KeyPad(R1,R2,R3,R4,C1,C2,C3,Enable,Num);
input logic R1,R2,R3,R4,C1,C2,C3;
output logic[3:0]Num;
output logic Enable;
always_comb
begin
if (~R1& ~R2 & ~R3 & ~R4 & ~C1 & ~C2 & ~C3)
Enable=0;
 if(R1&C1)
begin
Num=1;
Enable=1;
end
 if(R1 & C2)
begin
Num=2;
Enable=1;
end
 if(R1& C3)
begin
Num=3;
Enable=1;
end
 if(R2 & C1)
begin
Num=4;
Enable=1;
end
 if(R2 & C2)
begin
Num=5;
Enable=1;
end
if(R2 & C3)
begin
Num=6;
Enable=1;
end
else if(R3 & C1)
begin
Num=7;
Enable=1;
end
else if(R3 & C2)
begin
Num=8;
Enable=1;
end
else if(R3 & C3)
begin
Num=9;
Enable=1;
end
if(R4 & C2)
begin
Num=0;
Enable=1;
end
end
endmodule

