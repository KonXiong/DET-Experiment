module translate1(in,outh,outl);
input [3:0] in;
output [3:0] outh,outl;
reg[3:0] outh,outl;

always@(*)
begin
	outl = in%10;
	outh = in/10;
end
endmodule