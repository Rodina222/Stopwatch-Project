module  Error_count_MUX (s,y);
  input logic [1:0]s;// the selector
  output logic [3:0]y;// the output
  //This mux is used to display the error [-E:01] on the display in case the user attempts to change the counting mode while counting is in progress.

always_comb
begin
case(s)
 2'b00: y=4'b1110; //a1 represents 1 on the display
 2'b01: y=4'b1101;//a2 represents 0 on the display
 2'b10: y=4'b1100;//a3 represents E on the display
 2'b11: y=4'b1011;//a4 represents - on the display
 default:y=4'b0000;
 endcase
 end
 endmodule
