module Control_Module2 ( Reset,Set,Illegal,start,idle,new_mode,old_mode,y);
input logic Reset,Set,Illegal,start,idle,new_mode,old_mode;
  output logic  y;
  //This is the control module that represents a combinational circuit to indicate whether it is an error or it is the segment saver.It has the inputs(each is one bit): Reset,Set,Illegal(when illegal equals 0 it means legal),start(when start =0 it means stop),idle,new_mode,old_mode(which came from a flip-flop that stores it)and 1 output represents one bit.
always_comb
begin
  
  if(idle)
    y=1;
    
  else if(~Reset & Set & Illegal & ~idle)
    y=1;
    
  else if(Reset & Set & ~idle)
    y=1;
    
  else if(~Reset & ~Set & start & ~new_mode & old_mode & ~idle)
    y=1;
    
  else if(~Reset & ~Set & start & new_mode & ~old_mode & ~idle)
    y=1;
    
  else if(~Reset & Set & start & ~new_mode & ~old_mode & ~Illegal & ~idle)
    y=0;
   
  else if(~Reset & ~Set & start & new_mode & old_mode & ~idle)
    y=0; 
    
  else if(Reset & ~Set & ~idle)
    y=0;
else
y=0;
    
end

endmodule 
