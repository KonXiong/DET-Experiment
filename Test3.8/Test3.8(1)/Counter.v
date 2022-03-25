module Counter(count,clk,reset,mode,con);
	output reg [5:1]count;
	input [2:1]mode;
	input clk,reset,con;
	integer N;

	
	always@(posedge clk )
	begin
		case(mode)
			2'b11:N=16;
			2'b00:N=2;
			2'b01:N=8;
			2'b10:N=10;
		endcase
		if(!con)
			begin
			if(count==16)
				count<=5'b00000;
			else
				if(count==N-1)
					count<=5'b10000;
				else
					count<=count+1;
			end
		else
			begin
			if(count==0)
				count<=N-1;
			else
				count<=count+1;
			end
		if(reset) count <=5'b00000;
		
	end
	
endmodule



