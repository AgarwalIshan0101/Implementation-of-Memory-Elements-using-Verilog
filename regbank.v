// 32 * 32 register file with reset 

module regbank( rdata1, rdata2,wrdata,sr1,sr2 ,dr,write ,reset,clk); 
input clk ,reset, write; // write : to select write operation 
input [4:0] sr1 , sr2 ,dr ; 
input [31:0] wrdata ; // data to be written
output [31:0] rdata1 , rdata2 ; // data to be read
reg [31:0] regfile [0:31]; // 32 registers of 32 bits each
integer k;

assign rdata1 = regfile[sr1]; // read data from register sr1
assign rdata2 = regfile[sr2]; // read data from register sr2

always @(posedge clk) begin
    if (reset) begin
    for ( k=0; k < 32 ; k=k+1)
    begin 
    regfile[k] = 0 ; 
    end 
    end 
    else if (write) begin
        regfile[dr] <= wrdata; // write data to register dr
    end
end
endmodule   
