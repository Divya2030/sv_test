module queue (clk, rstn, enq, deq, din, dout, full, empty);
    
   parameter
	    DWIDTH = 32,
	    POINTER_WIDTH = 3,
	    Q_DEPTH = 8;

   localparam
            EMPTY = 2'b00,
            NOT_EMPTY = 2'b01,
            FULL = 2'b10;
   
   input        clk;
   input        rstn;
   input 	      enq;
   input 	      deq;
   input [DWIDTH-1:0] din;
   
   
   output 	   full;
   output 	   empty;
   output [DWIDTH-1:0] dout;

   reg	       full;
   reg		     empty;
   reg [DWIDTH-1:0]    dout;
   
   reg [DWIDTH-1:0]    queue [0:(Q_DEPTH-1)];
   reg [POINTER_WIDTH-1:0] head;
   reg [POINTER_WIDTH-1:0] tail;
   reg [1:0] 	state;
   reg [1:0] 	next_state;
      
   wire [POINTER_WIDTH-1:0] no_of_entry;
   assign no_of_entry = tail - head ;
   
   always @(posedge clk or negedge rstn) begin
	  if(!rstn) begin
	    state <= EMPTY;
	  end else begin
	    state <= next_state;
    end // if
   end // always


   always @* begin
	  case (state)
	    EMPTY: begin
	            empty = 1'b1;
	            full = 1'b0;
	            head = 3'b0;
	            tail = 3'b0;
	            if(!enq) next_state = EMPTY;
	            else next_state = NOT_EMPTY;
	           end
	    NOT_EMPTY: begin
	                empty = 1'b0;
	                full = 1'b0;
	                head = 3'b0;
	                tail = 3'b0;
	                if (deq && ~enq && (tail == (head + 1'b1)))
		                next_state = EMPTY;
	                else if (enq && ~deq && ((tail + 1'b1) == head))
		                next_state = FULL;
	                else if (enq && deq)
		                next_state = NOT_EMPTY;
	                else
		                next_state = NOT_EMPTY;
	               end
	    FULL: begin
	           empty = 1'b0;
	           full = 1'b1;
	           if (!deq) next_state = FULL;
	           else next_state = NOT_EMPTY;
	          end
	    default: next_state = EMPTY;
	  endcase
   end // always @*
   
   always @(posedge clk) begin
    if (enq && !full) begin
		  queue[tail] <= din;
		  tail <= tail + 1'b1;
	  end
	  if (deq && !empty) begin
		  dout <= queue[head];
		  head <= head + 1'b1;
	  end
          else dout <=32'b0;
   end // always 

endmodule
