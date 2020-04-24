class transaction;
   //declaring the transaction items
  randc bit  sel;
  randc bit  in0;
  randc bit  in1;
  bit out;
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- sel = %0d, in1 = %0d, in2 = %0d",sel,in0,in1);
    $display("- out = %0d",out);
    $display("-------------------------");
  endfunction
endclass