module MAC(
input [7:0] A, B,
input  clk, aclr,
output reg [15:0] MAC_OUT
);
wire [15:0] MUL_OUT;

assign MUL_OUT[15:0] = A[7:0] * B[7:0];
always@(posedge clk, posedge aclr) begin

MAC_OUT <= (aclr == 1)? 0 : MAC_OUT + MUL_OUT;
end

endmodule
