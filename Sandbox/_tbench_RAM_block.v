`timescale 1 ns/ 10 ps
module _tbench_RAM_block();
parameter period = 4;
reg [7:0] data_i;
reg [6:0] addr_w, addr_r;
reg wr, a_rd, CLK, oe;
wire [7:0] data_o;

RAM_block M(
	.CLK(CLK),
	.wr(wr),
	.a_rd(a_rd),
	.oe(oe),
	.addr_r(addr_r),
	.addr_w(addr_w),
	.data_o(data_o),
	.data_i(data_i)		
);

initial begin// Clock entity
	CLK = 1'b1;
	forever # (period/2)
	CLK = ~CLK;
end

initial begin// Clear signal entity
	oe = 0; 
	#150 oe = 1;
	#(period*2)oe = 0;
end

initial begin// Data/Addr entity
	addr_w = 0;
	data_i = 0;

	wr = 1;//begin writing
	#(period/2)
	addr_w = 100;
	repeat (addr_w + 1)
	begin
		#(period*3) data_i = 10 * addr_w;
		addr_w  = addr_w - 1;
	end

	wr = 0;//begin reading
	
end

initial begin// read entity
	a_rd = 0;
	addr_r = 100;
	#(period*5)
	a_rd = 1;
	repeat(addr_r) begin
		#(period*3)addr_r = addr_r - 1;
	end
	

end
initial #400 $stop;
endmodule
