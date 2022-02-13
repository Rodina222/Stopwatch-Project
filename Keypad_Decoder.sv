module Keypad_Decoder(B1, B2, buttonPressed, Num);
input logic B1, B2;
output logic [3:0] Num;
output logic buttonPressed;

always_comb
begin
if(B1)
begin
 Num <= 9;
  buttonPressed<=1;
end
else if (B2)
begin
Num <= 2;
buttonPressed<=1;
end
else
begin
Num<=0;
buttonPressed<=0;
end
end
endmodule
