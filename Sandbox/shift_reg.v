module shift_reg(LOAD, EN, CLK, A_CLR, IN, REG);
parameter N = 16; // width
input LOAD, EN, CLK, A_CLR;
input [N-1:0] IN;
output reg [N-1:0] REG;


always @(posedge CLK) begin
	if(LOAD)
		REG <= IN;//If A_CLR doesn't tie values to 0, we do parallel load (if LOAD == true)
	else if(EN)
		REG[N-1:0] <= {REG[N-2:0], 1'b0};// allow shift
 
end

always @(posedge A_CLR) begin

	REG <= (A_CLR ? 16'd0 : REG);

end

endmodule