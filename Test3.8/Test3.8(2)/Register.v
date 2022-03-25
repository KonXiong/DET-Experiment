module Register(clk,control,din,dout,re,mode);
	input clk,control,mode,re;
	input [3:0] din;
	output [3:0] dout;
	reg [3:0] dout;

	
	always @(posedge clk)
		begin
			if (re==1)
				dout <= 4'b0000;
			if (mode==1)
				dout <= din;
			else
				dout <= {dout[2:0], din[0]};
				
			if (control==0) 
				dout <= {dout[0],dout[3:1]};
			else
				dout <= {dout[2:0], dout[3]};
		end

endmodule
				