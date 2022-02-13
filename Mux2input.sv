module Mux2input(high,low,select,Output);
  input logic[1:0]high,low;
  input logic select;
  output logic[1:0]Output;
  always_comb
  begin
    case(select)
      0:Output=high;
      1:Output=low;
    endcase
  end
endmodule
