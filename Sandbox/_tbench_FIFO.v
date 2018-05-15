`timescale 1 ns/ 10 ps
module _tbench_FIFO();
parameter period = 10	;

reg aclr_n, EN, CLK;
reg [7:0] SHIN;
wire [7:0] OUT_W;

FIFO F(
.aclr_n(aclr_n), 
.EN(EN), 
.SHIN(SHIN), 
.CLK(CLK),
.OUT_W(OUT_W));

initial begin// EN entity
	EN = 1;
	#(period*3) EN = 0;
	#(period) EN = 1;
end


initial begin// Clock entity
	CLK = 1'b1;
	forever # (period/2)
	CLK = ~CLK;
end

initial begin// Clear signal entity
	aclr_n = 0; 
	#(period-1) aclr_n = 1;
end

initial begin// Data entity

#period;	
SHIN = 8'd1;
forever #period begin

SHIN = SHIN  << 1;
end


end

initial #200 $stop;
endmodule