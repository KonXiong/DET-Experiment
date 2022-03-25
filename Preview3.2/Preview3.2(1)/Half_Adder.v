module Half_Adder(A,B,Sh,Ch);
	input A,B;
	output Sh,Ch;
	
	assign Sh=!(A^~B);
	assign Ch=A&B;
endmodule