module FSM(
input clk, reset, w,
output reg out1
);
reg [3:0] state;
parameter s_A = 4'd0, s_B = 4'd1, s_C = 4'd2, s_D = 4'd3, s_E = 4'd4, 
s_F = 4'd5, s_G = 4'd6, s_H = 4'd7, s_I = 4'd8;

always@(posedge clk, posedge reset) begin
if (reset)
	state <= s_A;
else
case (state)
s_A: state <= (w) ? s_F : s_B;
s_B: state <= (w) ? s_F : s_C;
s_C: state <= (w) ? s_F : s_D;
s_D: state <= (w) ? s_F : s_E;
s_E: state <= (w) ? s_F : s_E;
s_F: state <= (w) ? s_G : s_B;
s_G: state <= (w) ? s_H : s_B;
s_H: state <= (w) ? s_I : s_B;
s_I: state <= (w) ? s_I : s_B;
default: state <= s_A;
end

always@(state)
case (state)
s_A, s_B, s_C, s_D, s_F, s_G, s_H: out1 = 0;
s_E, s_I: ou1 = 1;
endmodule
