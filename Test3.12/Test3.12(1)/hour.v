module hour(clk,reset,start,HL,HH);
input clk;
input reset,start;
output [3:0]HL,HH;
reg [3:0]HL,HH;
reg [7:0]cnt;

	always@(posedge clk or negedge reset)
	begin
	if (!reset)
		begin
		HL <= 4'd0;
		HH <= 4'd0;
		cnt <= 8'd0;
		end
	else
		begin
		if (!start)
			begin
			if (cnt==8'd23)
				begin
				cnt <= 8'd0;
				HL <= 4'd0;
				HH <= 4'd0;
				end
			else
				begin
				cnt <= cnt+8'd1;
				HL <= cnt%10;
				HH <= cnt/10;
				end
			end
		end
	end
	
endmodule