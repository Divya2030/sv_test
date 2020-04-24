class transaction;
   //declaring the transaction items
  rand bit UpOrDown;
  bit [0:3]count;
 // constraint distribution {data dist { 0 := 1 , 1 := 1 }; }
  
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- UpOrDown ",UpOrDown);
    $display("- count = %0d",count);
  //  $display("- carry = %0d",carry);
    $display("-------------------------");
  endfunction
endclass