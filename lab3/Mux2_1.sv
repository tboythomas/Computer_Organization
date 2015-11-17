module Mux2_1(in1, in2, select, data);
	input [31:0] in1, in2;
	input select;
	output [31:0]data;
	wire [31:0] andgate1, andgate2;
	
	genvar i;
	generate
 		for(i=0; i<32; i++) begin : eachMux
 				and a1(andgate1[i], in1[i], ~select);
				and a2(andgate2[i], in2[i], select);
				or o1(data[i], andgate1[i], andgate2[i]);
 	end
 	endgenerate 

endmodule

module Mux2_1_testbench();
	reg [31:0] in1, in2; 
	reg select;
	wire[31:0] data;

	Mux2_1 dut(.in1, .in2, .select, .data);
	initial begin
		select = 0; in1 = 32'b0; in2 = 32'b0; #10;
		select = 0; in1 = 32'b0; in2 = 32'b1; #10;
		select = 0; in1 = 32'b1; in2 = 32'b0; #10;
		select = 0; in1 = 32'b1; in2 = 32'b1; #10;
		select = 1; in1 = 32'b0; in2 = 32'b0; #10;
		select = 1; in1 = 32'b0; in2 = 32'b1; #10;
		select = 1; in1 = 32'b1; in2 = 32'b0; #10;
		select = 1; in1 = 32'b1; in2 = 32'b1; #10;
	end
endmodule
