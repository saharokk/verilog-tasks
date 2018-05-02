module MPA(
input clk, x1, x2, reset,
output [3:0] out
);	
reg[3:0] state;
parameter s_Y0 = 4'd0, s_Y1 = 4'd1, s_Y2 = 4'd2, s_Y3 = 4'd3, s_Y4 = 4'd4, 
s_Y5 = 4'd5, s_Y6 = 4'd6, s_Y7 = 4'd7, s_Y8 = 4'd8, s_Yk = 4'd9;

always@(posedge clk, posedge reset) begin
if (reset)
	state = s_Y0;
else
	case (state)
	s_Y0: state <= s_Y1;
	s_Y1: state <= s_Y2;
	s_Y2: state <= s_Y3;
	s_Y3: state <= (x1) ? s_Y4 : s_Y3;
	s_Y4: state <= s_Y5;
	s_Y5: state <= (x2) ? s_Y8 : s_Y6;
	s_Y6: state <= s_Y7;
	s_Y7, s_Y8: state <= s_Yk;
	default: state <= s_Y0;
	endcase
end

assign out = state;

endmodule