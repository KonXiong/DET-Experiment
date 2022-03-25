module Choice(A,B,C,F);
input A,B,C;
output F;
assign F = C ? A : B;
endmodule