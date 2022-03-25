module microsecond(clk,reset,MSL,MSH,co,start);
input clk,start;
input reset;
output co=1'b0;
reg co;
output [3:0]MSL,MSH;
reg[3:0]MSL,MSH;
reg[7:0]cnt;

	always@(posedge clk or negedge reset)
	begin
	if (!reset)
		begin
			MSL = 4'd0;
			MSH = 4'd0;
			cnt <= 8'd0;
		end
	else
		begin
			if(!start)
				begin
				if (cnt==8'd59)
					begin
					cnt <= 8'd0;
					MSL <= 4'd0;
					MSH <= 4'd0;
					co <= 1'b1;
					end
				else
					begin
					cnt <= cnt+8'd1;
					MSL <= cnt%10;
					MSH <= cnt/10;
					co <= 1'b0;
					end
			end
		end
	end
endmodule