module Stop_Watch (input logic  B1,B2,     //B1 indicate for button on FPGA give 9 B2 gives 2
input logic clk, sel_Stopwatch_Watch,                          // CLk from FPGA
input logic set,reset,start,mode,                // inputs from switches
output logic [7:0] Final_out,output logic D0,D1,D2,D3);         //outputs to segment display


//this part for declaration for internal wires
wire clk2,clk3,clk4,clk5,clk6,L,Enable,halfclk,oldmode,idle,Mux1enable,y,enableForError;
wire [3:0] Num,A,B,C,D,Sec1,Sec2,Min1,Min2,Out,ErrorI,ErrorE01,ErrorSet,segmentSaver,ERE59,Errors;
wire[1:0] select,Sel,lowcount,demuxinput;
wire[7:0]counterDigit,SevenbError,digit8,digit;
logic I=1;

// This part for taking inout from user using keypad
 User_Input USER (B1,B2,reset,clk,A,B,C,D);
// this counter modify clock to count for each second
             countsec count1sec (clk,reset,clk2);
// this module checker cheks the input taken from user wether in the range or not 
//with L=0 if legal and L=1 if illegal
Checker check_legal(A,B,C,D,L);
// Flip flop that store previous mode
D_Flip_flop ff(clk2,mode,oldmode);
// Main countrs of the stop_watch
 count9 count9sec (clk2,reset,mode,start,set,clk3,Sec1,A,L,oldmode,sel_Stopwatch_Watch);
count5 count5sec        (clk3,reset,mode,start,set,clk4,Sec2,B,Lmsel_Stopwatch_Watch);
count9 count9min        (clk4,reset,mode,start,set,clk5,Min1,C,L,oldmode,sel_Stopwatch_Watch);
lastCount5 lastCount5    (clk5,reset,mode,start,set,Min2,D,Lmsel_Stopwatch_Watch);
// 
counthalfsec clkhalf(clk,reset,halfclk);
high_speed_counter HSC(clk,reset,select);
MUX4input Mux_5(Sec1,Sec2,Min1,Min2,select,Out);
Counters_Decoder CD(Out,counterDigit);
// This part for errors
error_Illegal_MUX Illegal(select,ErrorI);   //
Error_count_MUX E01(select,ErrorE01);
Counter0to9 CounterforError(halfclk,enableForError);
tristateB tristateBuffer(ErrorI,enableForError,ERE59);
// C0:00
error_set_reset_MUX setError (select, ErrorSet);

Segment_Saver_Counter SSC(halfclk,reset,segmentSaver);
// Counter check wether the stopWatch idle or not
count30sec idleCounter(clk,reset,idle,start,set);
//Two control Modules
Control_Module2 M2 (reset,set,L,start,idle,mode,oldmode,Mux1enable);
Control_Module1 M1(reset,set,L,start,idle,mode,oldmode,Sel);
//Multiplexer select between errors or segment saver mode
MUX4input Mux3(ERE59,ErrorE01,ErrorSet,segmentSaver,Sel,Errors);
Errors_Decoder Edec(Errors,SevenbError);
MUX7b Mux1(counterDigit,SevenbError,Mux1enable,digit);

lowcounter lowCount(clk2,lowcount,reset);      
ANDgate gAnd(Sel[0],Sel[1],y);
//Multiplexer that select between high speed or low speed counter
Mux2input MuxNumber6(select,lowcount,y,demuxinput);
//Demultiplixer
deMUX Demux(demuxinput,I,D3,D2,D1,D0);
Watch_bonus Wbonus(clk,reset,set,sel_Stopwatch_Watch,A,B,C,D,digit8);
Main_MUX Mmux(digit8,digit,sel_Stopwatch_Watch,Final_out);
endmodule