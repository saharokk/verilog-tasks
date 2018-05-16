`timescale 1 ns/ 10 ps
module _tbench_waveGEN();
parameter period = 20;
reg [3:0] W_PUL_N;
reg START, LOAD;
wire OUT, RDY;

waveGEN G(
	.START(START),
	.W_PUL_N(W_PUL_N),
	.OUT(OUT),
	.RDY(RDY),
	.LOAD(LOAD)		
);

initial begin//START GEN
	START = 0;
	#(period/2)
	forever # (period*30+1)
		START = ~START;
end

initial begin// LOAD entity
	LOAD = 0;
	#(period/4)LOAD = 1;
	#(period/4) LOAD = 0;
	W_PUL_N = 4'd15;
	repeat (W_PUL_N + 1)
	begin
	#(period*30)
		W_PUL_N = W_PUL_N - 1;

		#period LOAD = 1;
		#period LOAD = 0;
	end
end
initial #9500 $stop;

endmodule


