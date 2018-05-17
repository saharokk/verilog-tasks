module chess_clock(CLK, LOAD, IN, A_CLR, VAL_1, VAL_2, CT_1, CT_2, Z_FLG);
parameter N = 16;//width
input CLK, LOAD, A_CLR, CT_1, CT_2;
input [N-1:0] IN;
output Z_FLG;
output [N-1:0] VAL_1, VAL_2;  
wire EN_1, EN_2;
wire Z_1, Z_2;

down_counter couner1(CLK, LOAD, IN, A_CLR, EN_1, Z_1, VAL_1);
down_counter couner2(CLK, LOAD, IN, A_CLR, EN_2, Z_2, VAL_2);

assign Z_FLG = Z_1 | Z_2;
assign EN_1 = CT_1 & ~CT_2;
assign EN_2 = ~CT_1 & CT_2;

endmodule

module down_counter(CLK, LOAD, IN, A_CLR, EN, Z, VAL);
parameter N = 16;//width
input CLK, LOAD, A_CLR, EN;
input [N-1:0] IN;
output reg Z; 
output [N-1:0] VAL; 
reg [N-1:0] V;

always @(posedge CLK) begin
	if(LOAD)
		V <= IN;//If A_CLR doesn't tie values to 0, we do parallel load (if LOAD == true)
	else if(EN)
		V <= (V ? V - 1'b1 : 1'b0);// allow shift and making sure counter won't go negative
end

always @(posedge A_CLR)//clear entity
	V <= (A_CLR ? 16'd0 : V);


always@(V)// Zero flag entity
	Z <= (!V ? 1'b1 : 1'b0);

assign VAL = V;
endmodule