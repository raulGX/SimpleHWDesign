module tb_sll;
	reg [31:0] in;
	wire [31:0] out;

	sll		shifter(.in(in), .out(out));

initial begin
	in = 8;
	#10 in = 20;

	#10 $finish;


end

endmodule
