class driver;
  int no_transactions;
 
  virtual add_if addif;
  
  
  mailbox gen2driv;
  
  //constructor
  function new(virtual add_if addif,mailbox gen2driv);
    //getting the interface
    this.addif = addif;
    //getting the mailbox handles from  environment 
    this.gen2driv = gen2driv;
  endfunction
  
  //Reset task, Reset the Interface signals to default/initial values
  task reset;
    wait(addif.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
    addif.a <= 0;
    addif.b <= 0;
    addif.c <= 0;
    
    wait(!addif.reset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  
  //drivers the transaction items to interface signals
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge addif.clk);
      
      addif.a     <= trans.a;
      addif.b     <= trans.b;
      addif.c     <= trans.c;
      @(posedge addif.clk);
     
      trans.sum   = addif.sum;
      trans.carry   = addif.carry;
      @(posedge addif.clk);
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass