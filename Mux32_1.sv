module Mux4_1(in, sel, out);
	input [31:0][3:0] in;
	input [1:0] sel;
	output [31:0]out;
	wire [31:0]t1, t2;

	mux2_1 m1 (in[2], in[1], sel[0], t1);
	mux2_1 m2 (in[0], in[3], sel[0], t2);
	mux2_1 m3 (t1, t2, sel[1], out);

endmodule

// mux 8 to 1
module Mux8_1(in, sel, out);
	input [31:0][7:0] in;
	input [2:0] sel;
	output [31:0]out;

	wire[31:0] t1, t2;

	Mux4_1 m1 (in[7:4], sel[1:0], t1);
	Mux4_1 m2 (in[3:0], sel[1:0], t2);
	Mux2_1 m3 (t1, t2, sel[2], out);

endmodule

//mux 16 to 1 
module Mux16_1(in, select, out);
	input [31:0][15:0] in;
	input [3:0] sel;
	output [31:0]out;

	wire[31:0] t1, t2;
	
	Mux8_1 m1 (in[7:0], sel[2:0], t1);
	Mux8_1 m2 (in[15:8], sel[2:0], t2);
	Mux2_1 m3 (t1, t2, sel[3], out);

endmodule

// mux 32 to 1 
module Mux32_1(in, sel, data);
	input [31:0][31:0] in;
	input [4:0] sel;
	output [31:0] data;

	wire[31:0] t1, t2;

	Mux16_1 m1 (in[15:0], sel[3:0], t1);
	Mux16_1 m2 (in[31:16], sel[2:0], t2);
	Mux2_1 m3 (t1, t2, data);

endmodule
