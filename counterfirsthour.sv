module counterfirsthour(Fsignal,Ssignal,set,select,hour,firshHour,mySignal);
input logic Fsignal,Ssignal,set,select;
input logic[3:0] hour;
output logic[3:0]firshHour;
output logic mySignal;
always_ff@(posedge set,posedge Fsignal)
begin
if(set & select)
begin
firshHour<=hour;
mySignal<=0;
end
else 
begin
if( ~Ssignal)
begin
if(firshHour<9)
begin
firshHour<=firshHour+1;
mySignal<=0;
end
else if(firshHour==9)
begin
firshHour<=0;
mySignal<=1;
end
end
else if(Ssignal)
begin
if(firshHour<3)
begin
firshHour<=firshHour+1;
mySignal<=0;
end
if(firshHour==3)
begin
firshHour<=0;
mySignal<=1;
end
end
end
end
endmodule