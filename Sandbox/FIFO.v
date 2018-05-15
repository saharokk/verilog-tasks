module FIFO(aclr_n, EN, SHIN, CLK, OUT_W);  

input aclr_n, EN, CLK;
input [7:0] SHIN;

output wire[7:0] OUT_W;

FIFO_1bit F0(aclr_n, EN, SHIN[0], CLK, OUT_W[0]);
FIFO_1bit F1(aclr_n, EN, SHIN[1], CLK, OUT_W[1]);
FIFO_1bit F2(aclr_n, EN, SHIN[2], CLK, OUT_W[2]);
FIFO_1bit F3(aclr_n, EN, SHIN[3], CLK, OUT_W[3]);
FIFO_1bit F4(aclr_n, EN, SHIN[4], CLK, OUT_W[4]);
FIFO_1bit F5(aclr_n, EN, SHIN[5], CLK, OUT_W[5]);
FIFO_1bit F6(aclr_n, EN, SHIN[6], CLK, OUT_W[6]);
FIFO_1bit F7(aclr_n, EN, SHIN[7], CLK, OUT_W[7]);

endmodule


module FIFO_1bit(aclr_n, EN, SHIN, CLK, OUT);  

input aclr_n, EN, CLK;
input SHIN;
reg [7:0] SHREG;
output wire OUT;

always @(posedge CLK, negedge aclr_n) begin
 if(!aclr_n)
	SHREG <= 1'd0;
 else if(EN)
	SHREG <= {SHREG[6:0], SHIN };
 	
end

 assign OUT = SHREG[7];

endmodule