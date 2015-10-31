module mux4to1(in0, in1, in2, in3, sel, out);
	input in0, in1, in2, in3;
	input [1:0] sel;
	output out;
	wire t1, t2;

	mux2to1 m1 (in3, in2, sel[0], t1);
	mux2to1 m2 (in1, in0, sel[0], t2);
	mux2to1 m3 (t1, t2, sel[1], out);

endmodule

