module ALU_32 (a, b, ctrl, out, zero, overflow, cout, neg);
	input [31:0] a, b;
	input [1:0] ctrl;
	output [31:0] out;
	output zero, overflow, cout, neg;
	wire [30:0] carr; //carrier between ALUs
	
	ALU_1 alu0 (.a(a[0]), .b(b[0]), .out(out[0]), .ctrl(ctrl), .Cin(ctrl[0]), .Cout(carr[0]));// define the very first digit of ALU
	genvar i;
	generate
		for (i = 1; i < 31; i++) begin : eachmod
			ALU_1 alu1 (.a(a[i]), .b(b[i]), .out(out[i]), .ctrl(ctrl), .Cin(carr[i-1]), .Cout(carr[i]));
			
		end
	endgenerate
	ALU_1 alu31 (.a(a[31]), .b(b[31]), .out(out[31]), .ctrl(ctrl), .Cin(carr[30]), .Cout(cout));
	assign neg = out[31];
	zeroflag32to1 z1 (.in(out), .out(zero));
	xor x1 (overflow, cout, carr[30]);
	
endmodule
	
