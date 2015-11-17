module InsFetchUnit(data_out, branch, jump, jr, zero_flag, data, clk, rst);
	input branch, jump, jr, zero_flag, clk, rst;
	input [29:0] data;
	output [31:0] data_out;
	
	wire [25:0] targetIns;
	wire [15:0] imm16;
	wire[29:0] PC, signEx, branchRes, concat, adderRes, jumpRes, jrRes;
	wire branchAndRes;
	
	//separate the inst
	assign concat = {PC[29:26], targetIns};
	// sign extend the imm16
	signEx16 extend (.data_out(signEx), .data_in(imm16));
	// result from the brach and zer flag
	and (branchAndRes, branch, zero_flag);
	genvar i;
	generate
		for(i = 0; i < 30; i++) begin: singleBit
			mux2_1 mux0 (.in1(1'b0), .in2(signEx[i]), .select(branchAndRes), .data(branchRes[i]));
			mux2_1 mux1 (.in1(adderRes[i]), .in2(concat[i]), .select(jump), .data(jumpRes[i]));
			mux2_1 mux2 (.in1(jumpRes[i]), .in2(data[i]), .select(jr), .data(jrRes[i]));
			D_FF tmp (.q(PC[i]), .d(jrRes[i]), .reset(rst), .clk(clk));
		end
	endgenerate

	// PC increment or jump
	adder_Ins sum (.data1(PC), .data2(branchRes), .carryIn(1'b1), .data_out(adderRes));

	//update the instruction Mem, concat the last bits to 00
	InstructionMem insM (.instruction(data_out), .address({PC, 2'b00}));

endmodule // InsFetchUnit