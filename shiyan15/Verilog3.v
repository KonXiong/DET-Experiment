module Verilog3(q1,q2,q3,q,cin);
	input [9:0] q1;
	input [9:0] q2;
	input [9:0] q3;
	input [1:0] cin;
	output reg [9:0] q;
	
	always @(*)
	begin
		if(cin==2'b00)
			q<=q1;
		else if(cin==2'b01)
			q<=q2;
		else 
			q<=q3;
	end
	
endmodule
