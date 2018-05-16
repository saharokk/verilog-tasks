`timescale 1 ns/ 10 ps
module waveGEN(START, W_PUL_N, LOAD , RDY, OUT);
integer i = 0;

input START, LOAD;
input [3:0] W_PUL_N;
output reg OUT, RDY; 
reg INTRN_CLK = 0;
reg [3:0] PUL_N;


always @(posedge INTRN_CLK)begin
	if(START) begin		
		i <= (i == 15) ? 0 : i + 1;	
		if (i < PUL_N)begin
			OUT <= 1'b1;
			RDY <= 1'b0;
		end		
		else begin //one cycle ended
			OUT <= 1'b0;
			RDY <= 1'b1;
		end	
	end
	else begin
	RDY = 1'b1;
	OUT = 1'b0;
	end
end

always @(negedge START)
	i <= 1'b0;

always @(posedge LOAD) begin
	if(LOAD) PUL_N <= W_PUL_N;
end

always @(negedge INTRN_CLK) begin
		OUT <= 0;

end

always 
	#10 INTRN_CLK <= !INTRN_CLK; //generator

endmodule
