// Code your design here
module upordown_counter(
    clk,
    reset,
    UpOrDown,  //high for UP counter and low for Down counter
    count
    );

    
    //input ports and their sizes
    input clk,reset,UpOrDown;
    //output ports and their size
  output [3 : 0] count;
    //Internal variables
  reg [3 : 0] count = 0;  
    
  always @(posedge(clk) or posedge(reset))
     begin
        if(reset == 1) 
            count <= 0;
        else    
            if(UpOrDown == 1)   //Up mode selected
              if(count == 15)
                    count <= 0;
                else
                    count <= count + 1; //Incremend Counter
            else  //Down mode selected
              if(count == 0)
                    count <= 15;
                else
                    count <= count - 1; //Decrement counter
     end    
    
endmodule



