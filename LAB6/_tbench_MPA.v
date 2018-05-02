`timescale 1 ns/ 10 ps
module _tbench_MPA();
parameter period = 4;
reg x1, x2, reset, clk;
wire [3:0] out;

MPA M(.clk(clk),
.reset(reset),
.x1(x1),
.x2(x2),
.out(out)
);

initial begin//Clock entity
	clk = 1'b1;
	forever #(period/2)
	clk = ~clk;
end


initial begin
	x1 = 0;
	x2 = 0;
	#(period*7) x1 = 1;
	x2 = 1;
end

initial begin
	reset = 1;
	#(period/2) reset = 0;
	#(period*11) reset = 1;
	#(period/2) reset = 0;
	
end
initial #100 $stop;

endmodule
