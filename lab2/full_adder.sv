module full_adder (Cin, Cout, a, b, s);
	input Cin, a, b;
	output Cout, s;
	wire [2:0] w;
	
	xor x1 (w[0], a, b);
	xor x2 (s, Cin, w[0]);
	and a1 (w[1], Cin, w[0]);
	and a2 (w[2], a, b);
	or o1 (Cout, w[1], w[2]);
	
endmodule

module adder_testbench();
	wire Cout, s;
	reg Cin, a, b;
	
	full_adder dut (.Cin, .Cout, .a, .b, .s);
	
	initial begin
		Cin = 0; #10;
		a = 0; b = 0; #10;
		a = 0; b = 1; #10;
		a = 1; b = 1; #10;
	end
endmodule

	