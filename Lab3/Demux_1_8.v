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
	
	/*assign OutZ[0] =  Out[0] : 'bz;
	assign OutZ[1] = !EN ? Out[1] : 'bz;
	assign OutZ[2] = !EN ? Out[2] : 'bz;
	assign OutZ[3] = !EN ? Out[3] : 'bz;
	assign OutZ[4] = !EN ? Out[4] : 'bz;
	assign OutZ[5] = !EN ? Out[5] : 'bz;
	assign OutZ[6] = !EN ? Out[6] : 'bz;
	assign OutZ[7] = !EN ? Out[7] : 'bz; */

endmodule
