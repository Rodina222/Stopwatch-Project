module MUX4input(Er0,Er1,Er2,Seg,S,Out); // Er0: []:59  Er1:-E:01 Er2:C0:00
input logic[3:0]Er0,Er1,Er2,Seg;
input logic[1:0]S;
output logic [3:0]Out;
always_comb
case(S)
00:Out=Er0;
01:Out=Er1;
10:Out=Er2;
11:Out=Seg;
endcase

endmodule
