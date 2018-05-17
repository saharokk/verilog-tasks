`timescale 1 ns/ 10 ps
module _tbench_shift_reg();
parameter period = 4;

reg A_CLR, EN, CLK, LOAD;
reg [15:0] IN;
wire [15:0] OUT;

shift_reg R(
.A_CLR(A_CLR), 
.EN(EN), 
.LOAD(LOAD),
.IN(IN), 
.CLK(CLK),
.REG(OUT));

initial begin// EN entity
	EN = 1;
	#(period*3) EN = 0;
	#(period*2) EN = 1;
end


initial begin// Clock entity
	CLK = 1'b1;
	forever # (period/2)
	CLK = ~CLK;
end

initial begin// Clear signal entity
	A_CLR = 0;
	#2 A_CLR = 1;
	#2 A_CLR = 0;
	#(period*8)A_CLR = 1; 
	#(period-1) A_CLR = 0;
end

initial begin// Data entity	
LOAD = 0;
IN = $urandom_range(0,512);
#(period-1) LOAD = 1;
#period LOAD = 0;
 
#(period*9)
IN = $urandom_range(0,512);
LOAD = 1;
#period LOAD =0;
end

initial #120 $stop;
endmodule
