module Demux_1_8 (Q, EN, Addr, OutZ);
	input Q, EN;
	input [2:0]Addr;
	output [7:0]OutZ;
	wire Out[7:0];
 	//tri OutZ[7:0];

	assign Out[0] =  ~Addr[0] & ~Addr[1] & ~Addr[2] & Q;
	assign Out[1] =   Addr[0] & ~Addr[1] & ~Addr[2] & Q;
  	assign Out[2] =  ~Addr[0] &  Addr[1] & ~Addr[2] & Q;
	assign Out[3] =   Addr[0] & ~Addr[1] & ~Addr[2] & Q;
	assign Out[4] =  ~Addr[0] & ~Addr[1] &  Addr[2] & Q;
	assign Out[5] =   Addr[0] & ~Addr[1] &  Addr[2] & Q;
	assign Out[6] =  ~Addr[0] &  Addr[1] &  Addr[2] & Q;
	assign Out[7] =   Addr[0] &  Addr[1] &  Addr[2] & Q;
	
	assign OutZ[0] = !EN ? Out[0] : 'bz;
	assign OutZ[1] = !EN ? Out[1] : 'bz;
	assign OutZ[2] = !EN ? Out[2] : 'bz;
	assign OutZ[3] = !EN ? Out[3] : 'bz;
	assign OutZ[4] = !EN ? Out[4] : 'bz;
	assign OutZ[5] = !EN ? Out[5] : 'bz;
	assign OutZ[6] = !EN ? Out[6] : 'bz;
	assign OutZ[7] = !EN ? Out[7] : 'bz; 

endmodule
