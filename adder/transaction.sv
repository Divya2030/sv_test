class transaction;
   //declaring the transaction items
  randc bit  a;
  randc bit  b;
  randc bit  c;
  bit [1:0]sum;
  bit carry;
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- a = %0d, b = %0d, c = %0d",a,b,c);
    $display("- sum = %0d",sum);
    $display("- carry = %0d",carry);
    $display("-------------------------");
  endfunction
endclass