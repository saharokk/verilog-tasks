module PWM_generator(EN, CLK, D_C, OUT);
integer i = 0;

input CLK, EN;
input [3:0] D_C;
output reg OUT; 

initial begin
OUT <= 1'b0;
end

always @(posedge CLK)begin
	if(EN) begin
		
		if(D_C == 4'd15) OUT <= 1;
		else begin
			i <= (i == 15) ? 0 : i + 1;	
			OUT <= (i >= D_C) ? 0 : 1;
		end
	end
end

endmodule