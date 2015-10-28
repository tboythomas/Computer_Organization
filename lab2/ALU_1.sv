module ALU_1 (a, b, out, ctrl, Cin, Cout);
	input a, b;
	input [1:0] ctrl;
	input Cin;
	output out, Cout;
	wire norout, sltuout, adderout, muxout;
	
	nor or1 (norout, a, b);

	mux2to1 mux1 (.in1(~b), .in0(b), .sel(ctrl[0]), .out(muxout));
	
	full_adder adder1 (.Cin(Cin), .Cout(Cout), .a(a), .b(muxout), .s(adderout));

	mux4to1 mux4 (.in0(adderout), .in1(adderout), .in2(norout), .in3(adderout), .sel(ctrl), .out(out));
	
endmodule

module ALU_testbench();
	reg a, b, Cin, Cout;
	reg [1:0] ctrl;
	wire out;
	
	ALU_1 dut (.a, .b, .out, .ctrl, .Cin, .Cout);
	initial begin 
		a = 0; b = 0; Cin = 0; ctrl = 2'b00; #10; //test full adder
		a = 0; b = 1; #10;
		a = 1; b = 0; #10;
		a = 1; b = 1; #10;
		a = 0; b = 0; Cin = 1; ctrl = 2'b01; #10; //test substract
		a = 0; b = 1; #10;
		a = 1; b = 1; #10;
		a = 1; b = 1; #10;
		a = 0; b = 0; ctrl = 2'b10; #10; //test nor
		a = 0; b = 1; #10;
		a = 1; b = 0; #10;
		a = 1; b = 1; #10;
		a = 0; b = 0; ctrl = 2'b11; #10; //test nor
		a = 0; b = 1; #10;
		a = 1; b = 1; #10;
		a = 1; b = 1; #10;
	end
endmodule

	
	