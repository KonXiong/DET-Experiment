module Generator(clk,din,dout);
	input clk;
	input [7:0] din; 
	output reg dout;
	integer cnt = 0;
	
	always@(posedge clk)
	//32 >= 00010000
		begin
			dout <= din[cnt];
			if (cnt==7) cnt=0;
			cnt=cnt+1;
		end

endmodule

