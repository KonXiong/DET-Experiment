module Detetor(din,clk,dout);
	input din,clk;
	output wire dout;
	reg [3:0] qtemp;
	
	
	always@(posedge clk)
	begin
		qtemp <= {din,qtemp[3:1]};
		//if (qtemp == 4'b1101) dout=1;
		//else dout=0;
	end	
	
	assign dout = (qtemp==4'b1101) ? 1 : 0;
endmodule