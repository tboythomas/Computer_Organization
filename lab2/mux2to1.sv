module mux2to1(in1, in0 , sel, out);

	input in0, in1;
	input sel;
	output out;
	wire andgate1, andgate2, notgate;
	
	and a1(andgate1, in1, sel);
	not n1(notgate, sel); 
	and a2(andgate2, in0, notgate);
	or o1(out, andgate1, andgate2);

endmodule

module mux2_testbench();
	wire out;
	reg in0, in1, sel;
	
	mux2to1 dut (.in0, .in1 , .sel, .out);
	
	initial begin
		in0 = 0; in1 = 1; sel = 0; #10;
		in0 = 0; in1 = 1;sel = 1; #10;
		in0 = 0; in1 = 1;sel = 0; #10;
		
	end
endmodule
	