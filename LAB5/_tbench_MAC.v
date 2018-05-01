`timescale 1 ns/ 10 ps
module _tbench_MAC();
parameter period = 2;

reg [7:0] A, B;
reg clk, aclr;
wire[15:0] MAC_OUT;

MAC M(
	.clk(clk),
	.aclr(aclr),
	.A(A),
	.B(B),
	.MAC_OUT(MAC_OUT)
);

initial begin//Clock entity
	clk = 1'b1;
	forever # (period/2)
	clk = ~clk;
end


initial begin
	A = 8'h02;
	B = 8'h00;
	forever #(period) begin
		A = A + 1;
		B = B + 2;
	end
end

initial begin
	aclr = 1;
	#1 aclr = 0;
	forever #(5*period) begin
		aclr = 1;
		
end
initial #150 $stop;

endmodule