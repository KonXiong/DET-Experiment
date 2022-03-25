module translate2(in,outh,outl,outs);
input [7:0] in;
output [3:0] outh,outl,outs;
reg[3:0] outh,outl,outs;

always@(*)
begin
	outl = in%10;
	outs = in/10%10;
	outh = in/100;
end
endmodule