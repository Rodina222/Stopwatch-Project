module error_Illegal_MUX (s,y);
  input logic [1:0]s   ;               // the selector
  output logic [3:0]y ;             // the output
  //This mux is used to display the error []:59 on the display in case of setting  time to an illegal value.
 
always_comb
begin
case(s)
 2'b00: y=4'b1010; //a1 represents 9 on the display
 2'b01: y=4'b1001;//a2 represents 5 on the display
 2'b10: y=4'b1000;//a3 represents ] on the display
 2'b11: y=4'b0111;//a4 represents [ on the display
 default:y=4'b0000;
 endcase
 end
 endmodule
