module TSL(A,B,EN,Y);
input A,B,EN;
output Y;
assign Y = (!EN)? (A&&B):0;
endmodule