module SignEx16(data_in, data_out);
	input [15:0] data_in;
	output [29:0] data_out;

	assign data_out = {
						in[15],in[15],in[15],in[15],in[15],in[15],in[15],
						in[15],in[15],in[15],in[15],in[15],in[15],in[15], 
						data_in
						};
endmodule // SignEx16
