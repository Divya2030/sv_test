`include "env.sv"
program test(count_if i_intf);
  //declaring environment instance
  environment env;
  
  initial begin
    //creating environment
    env = new(i_intf);
    
    //setting the repeat count of generator as 4, means to generate 4 packets
    env.gen.repeat_count = 40;
    
    //calling run of env, it interns calls generator and driver main tasks.
    env.run();
  end
endprogram