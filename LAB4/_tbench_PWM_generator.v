`timescale 1 ns/ 10 ps
module _tbench_PWM_generator();
parameter period = 2;
reg [3:0] D_C;
reg EN, CLK;
wire OUT;

PWM_generator G(
	.CLK(CLK),
	.EN(EN),
	.OUT(OUT),
	.D_C(D_C)		
);

initial begin// Clock entity
	CLK = 1'b1;
	forever # (period/2)
	CLK = ~CLK;
end

initial begin// Enable signal entity
	EN = 0; 
	#75 EN = 1;
end

initial begin// Duty cycle select entity
	D_C = 0;
	forever 
	#500 D_C = D_C + 1;	
end

initial #8500 $stop;

endmodule


