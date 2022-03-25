module minute(clk,reset,ML,MH,co,start);
input clk,start;
input reset;
output co=1'b0;
reg co;
output [3:0]ML,MH;
reg[3:0]ML,MH;
reg[7:0]cnt;

	always@(posedge clk or negedge reset)
	begin
	if (!reset)
		begin
			ML = 4'd0;
			MH = 4'd0;
			cnt <= 8'd0;
		end
	else
		begin
			if(!start)
				begin
				if (cnt==8'd59)
					begin
					cnt <= 8'd0;
					ML <= 4'd0;
					MH <= 4'd0;
					co <= 1'b1;
					end
				else
					begin
					co = 1'b0;
					cnt = cnt+ 8'd1;
					ML <= cnt%10;
					MH <= cnt/10;
					end
			end
		end
	end
endmodule