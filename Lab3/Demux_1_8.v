module Demux_1_8 (Q, EN, Addr, Out);
	input Q, EN;
	input [2:0]Addr;
	output [7:0]Out;
 		
	assign Out[0] = !EN ? ~Addr[0] & ~Addr[1] & ~Addr[2] & Q  : 'bz;
	assign Out[1] = !EN ?  Addr[0] & ~Addr[1] & ~Addr[2] & Q : 'bz;
  	assign Out[2] = !EN ? ~Addr[0] &  Addr[1] & ~Addr[2] & Q : 'bz;
	assign Out[3] = !EN ?  Addr[0] &  Addr[1] & ~Addr[2] & Q : 'bz;
	assign Out[4] = !EN ? ~Addr[0] & ~Addr[1] &  Addr[2] & Q : 'bz;
	assign Out[5] = !EN ?  Addr[0] & ~Addr[1] &  Addr[2] & Q : 'bz;
	assign Out[6] = !EN ? ~Addr[0] &  Addr[1] &  Addr[2] & Q : 'bz;
	assign Out[7] = !EN ?  Addr[0] &  Addr[1] &  Addr[2] & Q : 'bz;

endmodule
