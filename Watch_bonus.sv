module Watch_bonus(clk,reset,set,select,A,B,C,D,digit8);
input logic clk,reset,set,select;
input logic[3:0]A,B,C,D;
output logic[7:0] digit8;
wire[3:0] Min1,Min2,Hour1,Hour2;
wire clk2 ,SignalM1,SignalM2,SH1,SH2;
wire[1:0] out;
wire [3:0] fourbitcount;
Count60s modifyclk(clk,reset,clk2);
//countsec c1(clk,reset,clk2);
high_speed_counter HSP(clk,reset,out);
CounterfirstMin M1(clk2,set,select,A,Min1,SignalM1);
countersecondMin M2(SignalM1,set,select,B,Min2,SignalM2);
counterfirsthour H1(SignalM2,SH2,set,select,C,Hour1,SH1);
countersecondhour H2(SH1,set,select,D,Hour2,SH2);
MUX4input  M4i(Min1,Min2,Hour1,Hour2,out,fourbitcount);
Counters_Decoder Decoder( fourbitcount, digit8);
endmodule
