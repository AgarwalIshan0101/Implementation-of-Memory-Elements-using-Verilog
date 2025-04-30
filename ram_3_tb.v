`include "ram_3.v"

module ram_test;
reg [9:0]addr;
wire [7:0] data_out;
reg [7:0] data_in;
reg write , select ;
integer k ,myseed ; 

ram_3 ram(data_out, data_in,addr,write,select);

initial begin 
for ( k=0; k<=1023; k=k+1)
begin 
data_in = (k+k) % 256 ; write = 1 ; select = 1 ; 
addr = k ;
#3 write =0 ; select = 0 ; 
end 

repeat (20)
begin 
#2 addr = $random(myseed) % 1024 ;write =0 ; select =1 ; 
$display ( "Address = %5d, Data = %4d ", addr , data_out);
end
end 
initial myseed = 35 ; 

endmodule

