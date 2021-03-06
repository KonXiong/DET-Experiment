module Choice(EN,A,Y,D);
input [1:0]A;
input [3:0]D;
input EN;
output reg Y;
always @(*)
begin
	if (EN==1)
		Y=0;
	else
		case(A)
			2'b00:Y=D[0];
			2'b01:Y=D[1];
			2'b10:Y=D[2];
			2'b11:Y=D[3];
		endcase
	end
endmodule	