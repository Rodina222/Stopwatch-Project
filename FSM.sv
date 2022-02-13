module FSM (clk,reset,enable,Num,enable_A,enable_B,enable_C,enable_D,A,B,C,D);
input logic clk,reset,enable;
input logic [3:0] Num;
output logic [3:0] A,B,C,D;
output logic enable_A,enable_B,enable_C,enable_D;//each of them represents 1 bit each of them is the enable for one of the registers to store the 4 outputs

//It is the module responsible for taking the input digits(which represents the second and minutes) from the user when he switches on the set switch to set the number he wants to start from it the countdown.


logic[3:0]state,nextstate;
 parameter s0=4'b0000;
 parameter s0b=4'b0001;
 parameter s1= 4'b0010;
 parameter s2= 4'b0011;
 parameter s2b=4'b0100;
 parameter s3= 4'b0101;
 parameter s4=4'b0110;
 parameter s4b=4'b0111;
 parameter s5=4'b1000;
 parameter s6=4'b1010;
 parameter s6b=4'b1011;
 parameter s7=4'b1100;

 


always_ff @ (posedge clk,posedge reset)
if (reset) state <= s1;
else state <= nextstate;


always_comb
begin
case(state)
s1: if(~enable)
nextstate= s1;
 else
 nextstate= s2;

s2: nextstate= s2b;
 s2b: if(enable)
 nextstate= s2b;
else
nextstate= s3;

s3: if(~enable)
nextstate= s3;
else
 nextstate= s4;

s4:nextstate= s4b;
s4b: if(enable)
 nextstate= s4b;
else
 nextstate= s5;

s5: if(enable)
 nextstate= s6;
else
nextstate= s5;

s6: nextstate= s6b;
s6b: if(enable)
 nextstate= s6b;
else
nextstate= s7;

s7: if(enable)
 nextstate= s0;
else
nextstate= s7;

s0:nextstate= s0b;
s0b: if(enable)
 nextstate= s0b;
else
nextstate= s1;

endcase
end


always_comb
begin
if (state==s2)
assign A=Num;
if (state==s4)
assign B=Num;
if (state==s6)
assign C=Num;
if (state==s0)
assign D=Num;
end

assign enable_A=(state==s2);
assign enable_B=(state==s4);
assign enable_C=(state==s6);
assign enable_D=(state==s0);



endmodule
