module Seven_Segment_Decoders(EN,A0,A1,A2,A3,Ya,Yb,Yc,Yd,Ye,Yf,Yg);
input EN,A0,A1,A2,A3;
output Ya,Yb,Yc,Yd,Ye,Yf,Yg;
assign Ya = !((!A3)&(!A2)&(!A1)&A0 | A3&A1 | A2&(!A0)) & EN;
assign Yb = !(A3&A1 | A2&A1&(!A0) | A2&(!A1)&A0) & EN;
assign Yc = !(A3&A2 | (!A2)&A1&(!A0)) & EN;
assign Yd = !(A2&A1&A0 | A2&(!A1)&(!A0) | (!A2)&(!A1)&A0) & EN;
assign Ye = !(A2&(!A1) | A0) & EN;
assign Yf = !((!A3)&(!A2)&A0 | (!A2)&A1 | A1&A0) & EN;
assign Yg = !((!A3)&(!A2)&(!A1) | A2&A1&A0) & EN;
endmodule