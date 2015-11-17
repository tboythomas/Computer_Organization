module adder_Ins(data1, data2, carryIn, data_out);
	input carryIn;
	input [29:0] data1, data2;
	output [29:0] data_out;

	wire [29:0] carryOut;

	full_adder tmp (.a(data1[0]), .b(data2[0]), .Cin(carryIn), .Cout(carryOut[0]), .s(data_out[0]));

	genvar i;
	generate
		for(i = 1; i < 30; i++) begin:eachadder
			full_adder tmpadder (.a(data1[i]), .b(data2[i]), .Cin(carryIn[i - 1]), .Cout(carryOut[i]), .s(data_out[i]));
		end // eachadder
	endgenerate
endmodule // adder_Ins