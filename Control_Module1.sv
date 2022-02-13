module Control_Module1 (input logic Reset,set,Illegal,start,idle,new_mode,old_mode,
 output logic  [1:0]y);
  
  //This is control module1 that represents a combinational circuit that indicates whether there are errors done by the user or not.it has the inputs(each is one bit): Reset,Set,Illegal(when illegal equals 0 it means legal),start(when start =0 it means stop),idle,new_mode,old_mode(which came from a flip-flop that stores it)and 2 outputs each one represents one bit.
always_comb
begin
  if (idle)
    y=3;
  else if(set & Illegal & ~Reset & ~idle)
   y=0;
  else if(set & Reset & ~idle)
   y=2;
 else   if(~set & ~Reset & old_mode & start & ~new_mode & ~idle)
    y=1;
  else  if(~set & ~Reset & ~old_mode & start & new_mode & ~idle)
    y=1;
 else if(set & ~Reset & ~old_mode & start & ~new_mode & ~Illegal & ~idle )
   y=0; 
 else   if(~set & ~Reset & old_mode & start & new_mode & ~idle )
   y=0;
  else  if(~set & Reset & ~idle )
    y=0;
else 
   y=0;
  end

endmodule
