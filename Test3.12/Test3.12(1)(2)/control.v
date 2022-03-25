module control(ctr,X,Y);
input ctr,X;
output Y;

assign Y = ctr ? X : 0;
endmodule