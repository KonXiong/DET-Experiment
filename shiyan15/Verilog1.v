module Verilog1(clk,rst,fenp,cnt);
	input clk,rst;
	input [2:0] fenp;
	output reg [9:0] cnt;
	
	initial cnt=10'd0;
	reg clk_out;
	reg [2:0] i;
	initial i=3'd0;
	always @(posedge clk)
	begin
		if(i==fenp)
			begin
			clk_out=!clk_out;
			i<=0;
			end
		else
			i<=i+1;
    end
    
    always @(posedge clk_out or negedge rst)
    begin
	if(!rst)
		begin
			cnt<=8'd0;
			
		end
	else if(cnt>=10'd1000)
		cnt<=0;
	else
		cnt<=cnt+1;
	end
endmodule
