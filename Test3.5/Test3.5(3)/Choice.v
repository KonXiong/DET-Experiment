module Choice(EN,A1,A0,D0,D1,D2,D3,Y);
input EN,A1,A0,D0,D1,D2,D3;
output Y;
assign Y = EN ? 0 : (A1 ? (A0 ? D3:D2) : (A0 ? D1:D0));
endmodule