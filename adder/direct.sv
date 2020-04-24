`include "env.sv"
program test(add_if i_intf);
  
  class my_trans extends transaction;
    
    bit [1:0] count;
    
    function void pre_randomize();
      a.rand_mode(0);
      b.rand_mode(0);          
      c.rand_mode(0);          

      a = 10;
      b = 12;
      c = 15;
    endfunction
    
  endclass
    
  //declaring environment instance
  environment env;
  my_trans my_tr;
  
  initial begin
    //creating environment
    env = new(i_intf);
    
    my_tr = new();
    
    //setting the repeat count of generator as 4, means to generate 4 packets
    env.gen.repeat_count = 20;
    
    env.gen.trans = my_tr;
    
    //calling run of env, it interns calls generator and driver main tasks.
    env.run();
  end
 
endprogram