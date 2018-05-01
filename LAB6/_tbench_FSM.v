`timescale 1 ns/ 10 ps
module _tbench_FSM();
parameter period = 4;
reg w, reset, clk;
wire out1;

FSM M(.clk(clk),
.reset(reset),
.w(w),
.out1(out1)
);

initial begin//Clock entity
	clk = 1'b1;
	forever # (period/2)
	clk = ~clk;
end


initial begin
	w = 0;
	forever #(period*6) begin	
	w = ~w;	
	end
end

initial begin
	reset = 1;
	#(period/2) reset = 0;
	#(period*5) reset = 1;
	#(period/2) reset = 0;
	
end
initial #50 $stop;

endmodule