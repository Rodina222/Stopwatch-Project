module countersecondhour(signal,set,select,hour,secondhour,mySignal);
input logic signal,set,select;
input logic [3:0] hour;
output logic[3:0]secondhour;
output logic mySignal;
always_ff@(posedge set,posedge signal)
begin
if(set & select)
begin
secondhour<=hour;
mySignal<=0;
end
else
begin
if(secondhour<2)
begin
secondhour<=secondhour+1;
mySignal<=0;
end
if(secondhour==2)
begin
secondhour<=0;
mySignal<=1;
end
end
end
endmodule
