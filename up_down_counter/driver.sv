class driver;
  int no_transactions;
  virtual count_if cntif;
  
  mailbox gen2driv;
  
  function new(virtual count_if cntif,mailbox gen2driv);
    this.cntif=cntif;
    this.gen2driv=gen2driv;
  endfunction
  
  task reset;
    wait(cntif.reset);
    cntif.count=0;
    $display("Driver reset started");
    
    wait(!cntif.reset);
     $display("Driver reset ended");
   endtask
             
    task main;
          forever begin
      transaction trans;
      gen2driv.get(trans);
         @(posedge cntif.clk);
      
            cntif.UpOrDown     <= trans.UpOrDown;
      @(posedge cntif.clk);
     
      trans.count   = cntif.count;
      @(posedge cntif.clk);
      trans.display("[ Driver ]");
      no_transactions++;
    end
  endtask
  
endclass 