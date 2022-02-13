module User_Input (B1,B2,reset,clk,A,B,C,D);
input logic B1,B2,clk,reset;

output logic [3:0]A,B,C,D;
wire[3:0]a,b,c,d;
wire[3:0]Num;
wire enable,enable_A,enable_B,enable_C,enable_D;
//It is a module that relates the keypad decoder with the FSM and the 4 registers that store the 4 outputs A,B,C,D.
Keypad_Decoder decode (B1, B2,enable, Num);
FSM finite_State(clk,reset,enable,Num,enable_A,enable_B,enable_C,enable_D,a,b,c,d);
Register AA(clk,enable_A,a,A);
Register BB(clk,enable_B,b,B);
Register CC(clk,enable_C,c,C);
Register DD(clk,enable_D,d,D);

endmodule
