`timescale 1 ns/ 10 ps
module _tbench_chess_clock();
parameter period = 4;

reg A_CLR, CT_1, CT_2, CLK, LOAD;
reg [15:0] IN;
wire Z_FLG;
wire [15:0] VAL_1, VAL_2;

chess_clock C(
.A_CLR(A_CLR), 
.CT_1(CT_1),
.CT_2(CT_2), 
.VAL_1(VAL_1),
.VAL_2(VAL_2),
.LOAD(LOAD),
.IN(IN), 
.CLK(CLK),
.Z_FLG(Z_FLG));

initial begin// EN entity
	CT_1 = 0;
	CT_2 = 0;
	#period	
	CT_1 = 1;
	#(period*15)
	CT_1 = 0;
	CT_2 = 1;
	#(period*15)
	CT_1 = 1;
	CT_2 = 1;
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
	#(period*40)A_CLR = 1; 
	#(period-1) A_CLR = 0;
end

initial begin// Data entity	
LOAD = 0;
IN = $urandom_range(0,15);
#(period-1) LOAD = 1;
#period LOAD = 0;
 
#(period*9)
IN = $urandom_range(0,15);
LOAD = 1;
#period LOAD =0;

#(period*15)
IN = $urandom_range(0,15);
LOAD = 1;
#period LOAD =0;
end

initial #180 $stop;
endmodule
