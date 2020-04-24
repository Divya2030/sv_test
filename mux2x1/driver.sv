class driver;
  int no_transactions;
 
  virtual mux_if muxif;
  
  
  mailbox gen2driv;
  
  //constructor
  function new(virtual mux_if muxif,mailbox gen2driv);
    //getting the interface
    this.muxif = muxif;
    //getting the mailbox handles from  environment 
    this.gen2driv = gen2driv;
  endfunction
  
  //Reset task, Reset the Interface signals to default/initial values
  task reset;
    wait(muxif.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
    muxif.sel <= 0;
    muxif.in0 <= 0;
    muxif.in1 <= 0;
    
    wait(!muxif.reset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  
  //drivers the transaction items to interface signals
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge muxif.clk);
      
      muxif.sel     <= trans.sel;
      muxif.in0     <= trans.in0;
      muxif.in1    <= trans.in1;
      @(posedge muxif.clk);
     
      trans.out   = muxif.out;
      @(posedge muxif.clk);
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass