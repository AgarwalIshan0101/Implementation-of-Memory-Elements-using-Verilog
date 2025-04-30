// modelling single port RAM with synchronous read / write 
// taking 8 bit word and 1024 bit word length

module mem(addr , data, clk , rd , wr , cs );
input  [9:0] addr; // addr : address , since it is 1024 address ,10 bits are required 
input  clk ,wr ,rd,cs; // wr : write signal . rd : read signal , cs : chip select 
input [7:0] data;
reg [7:0] mem[1023:0] ; reg [7:0]d_out;

assign data = (cs && rd )? d_out : 8'bz;
always @(posedge clk )
if (cs && wr && !rd) mem[addr] = data ;
always @(posedge clk )
if (cs && rd && !wr) d_out = mem[addr];
endmodule