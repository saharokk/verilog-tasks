`timescale 1 ns/ 10 ps
module _tbench_RAM_block();
parameter period = 4;
reg [7:0] data_i;
reg [3:0] addr;
reg CLR, WE, CLK;
wire [7:0] data_o;

RAM_block M(
	.CLK(CLK),
	.WE(WE),
	.CLR(CLR),
	.addr(addr),
	.data_o(data_o),
	.data_i(data_i)		
);

initial begin// Clock entity
	CLK = 1'b1;
	forever # (period/2)
	CLK = ~CLK;
end

initial begin// Clear signal entity
	CLR = 0; 
	#150 CLR = 1;
end

initial begin// Data/Addr entity
	addr = 0;
	data_i = 0;

	WE = 1;//begin writing
	#(period/2)
	addr = 15;
	repeat (addr + 1)
	begin
		#(period) data_i = 10 * addr;
		addr  = addr - 1;
	end

	WE = 0;//begin reading
	data_i = 0; 
	addr = 15;
	repeat(addr) begin
		#(period)addr = addr - 1;
	end
	#(period)CLR = 1;//reset memory
	#(period)CLR = 0;

	WE = 0;//begin reading
	data_i = 0; 
	addr = 15;
	repeat(addr) begin
		#(period)addr = addr - 1;
	end


end

initial #200 $stop;
endmodule