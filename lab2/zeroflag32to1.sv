module zeroflag4to1 (in, out);
	input [3:0] in;
	output out;
	
	nor nor1 (out, in[3], in[2], in[1], in[0]);
endmodule

module zeroflag16to1 (in, out);
	input [15:0] in;
	output out;
	
	wire [3:0] temp;
	
	zeroflag4to1 z1 (.in(in[15:12]), .out(temp[3]));
	zeroflag4to1 z2 (.in(in[11:8]), .out(temp[2]));
	zeroflag4to1 z3 (.in(in[7:4]), .out(temp[1]));
	zeroflag4to1 z4 (.in(in[3:0]), .out(temp[0]));
	and nor2 (out, temp[3], temp[2], temp[1], temp[0]);
endmodule


module zeroflag32to1 (in, out);
	input [31:0] in;
	output out;
	wire [1:0] temp;

	zeroflag16to1 z1 (.in(in[31:16]), .out(temp[1]));
	zeroflag16to1 z2 (.in(in[15:0]), .out(temp[0]));
	and nor1 (out, temp[1], temp[0]);
endmodule

module zeroflag32to1_testbench(); 
	reg [31:0] in;
	wire out;
	
	zeroflag32to1 dut (.in, .out);
	
	integer i;
	initial begin
		in= 32'b0; #10;
		for (i=0; i<32; i++) begin 
			in[i] = 1; #10;
			in[i] = 0; #10;
		end
	end
endmodule

module zeroflag4to1_testbench(); 
	reg [3:0] in;
	wire out;
	
	zeroflag4to1 dut (.in, .out);
	
	integer i;
	initial begin
		in= 4'b0; #10;
		for (i=0; i<4; i++) begin 
			in[i] = 1; #10;
			in[i] = 0; #10;
		end
	end
endmodule
	
module zeroflag16to1_testbench(); 
	reg [15:0] in;
	wire out;
	
	zeroflag16to1 dut (.in, .out);
	
	integer i;
	initial begin
		in= 16'b0; #10;
		for (i=0; i<16; i++) begin 
			in[i] = 1; #10;
			in[i] = 0; #10;
		end
	end
endmodule


