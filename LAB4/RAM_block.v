module RAM_block(CLK, addr, data_i, data_o, WE, CLR);
parameter w = 16; //w words
parameter n = 8;// n bit word
integer i = 0;

input CLK, WE, CLR;
input [3:0] addr;
input [n-1:0] data_i;
output [n-1:0] data_o; 

reg[n-1:0] M[w-1:0];
reg[n-1:0] data_o; 

initial begin//reset buses and cells
	for (i = 0;i < w; i = i + 1) begin
		M[i] <= 0;
	end
	data_o = 0;
end

always @(posedge CLK)begin
	if (CLR)
		for (i = 0;i < w; i = i + 1) begin
			M[i] <= 0;	
		end
	if (WE)
		M[addr] <= data_i;//assign 8-bit value to a certain cell in memory ruled by addr
	else
		data_o <= M[addr]; 
end

endmodule