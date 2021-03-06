module Verilog2(zhengfu,q,chengq);
	input [9:0] q;
	input [1:0]zhengfu;
	output reg [9:0] chengq;
	
	always @(*)
	begin
		if(zhengfu==2'b00)
			chengq=q;
		else if(zhengfu==2'b01)
			chengq=q>>1;
		else if(zhengfu==2'b10)
			chengq=q>>2;
		else 
			chengq=q>>3;
	end
	
endmodule
