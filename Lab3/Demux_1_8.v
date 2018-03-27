module Demux_1_8 (Q, EN, Addr, OutZ);
	input Q, EN;
	input [2:0]Addr;
	output [7:0]OutZ;
	wire Out[7:0];
 	
	assign Out[0] =  ~Addr[0] & ~Addr[1] & ~Addr[2] & Q;
	assign Out[1] =   Addr[0] & ~Addr[1] & ~Addr[2] & Q;
  	assign Out[2] =  ~Addr[0] &  Addr[1] & ~Addr[2] & Q;
	assign Out[3] =   Addr[0] & ~Addr[1] & ~Addr[2] & Q;
	assign Out[4] =  ~Addr[0] & ~Addr[1] &  Addr[2] & Q;
	assign Out[5] =   Addr[0] & ~Addr[1] &  Addr[2] & Q;
	assign Out[6] =  ~Addr[0] &  Addr[1] &  Addr[2] & Q;
	assign Out[7] =   Addr[0] &  Addr[1] &  Addr[2] & Q;

	
endmodule
