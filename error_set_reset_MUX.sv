module  error_set_reset_MUX(s,y);
  input logic [1:0]s ;       // the selector
  output logic [3:0]y ;     // the output
  //This mux is used to display the error S0:00 on the display in case of setting and resetting at the same time .
 
always_comb
begin
case(s)
 2'b00: y=4'b1101; //a1 represents 0 on the display
 2'b01: y=4'b1101;//a2 represents 0 on the display
 2'b10: y=4'b1101;//a3 represents 0 on the display
 2'b11: y=4'b1111;//a4 represents C on the display
 default:y=4'b0000;
 endcase
 end
 endmodule
