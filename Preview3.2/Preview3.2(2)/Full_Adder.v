module Full_Adder(A,B,C,S,C1);
	input A,B,C;
	output S,C1;
	assign S = (A&&(!B)&&(!C)) || (A&&B&&C) || ((!A)&&(!B)&&C) || ((!A)&&B&&(!C));
	assign C1 = (A&&C) || (B&&C) || (A&&B);
endmodule