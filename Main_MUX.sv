module Main_MUX (Watch_Decoder,MUX4,Select,Out); // this module is used to select either the stopwatch or the watch
input logic[7:0] Watch_Decoder,MUX4; 
input logic Select; // Select is the button that the user uses to select the watch
output logic [3:0] Out;

always_comb
case(Select)

0:Out=MUX4;
1:Out=Watch_Decoder;
endcase

endmodule
