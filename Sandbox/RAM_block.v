module RAM_block(CLK, addr_r, addr_w, data_i, data_o, wr, a_rd, oe);
parameter w = 128; //w words
parameter n = 8;// n bit word
parameter a_n = 7;//width of address bus
integer i = 0;

input CLK, a_rd, wr, oe;
input [a_n-1:0] addr_r;
input [a_n-1:0] addr_w;
input [n-1:0] data_i;
output reg [n-1:0] data_o; 

reg[n-1:0] M[w-1:0];


always @(posedge CLK, posedge a_rd, posedge oe)begin
	if (a_rd && !oe)
		data_o <= M[addr_r];	 

	if (wr)
		M[addr_w] <= data_i;//assign 8-bit value to a certain cell in memory ruled by addr

end

always @(posedge oe, oe)begin
	if (oe) data_o <=  8'hZ;
	else data_o <= data_o;
end

endmodule

