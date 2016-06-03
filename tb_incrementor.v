module tb_incrementor;

	reg [31:0] in;
	wire [31:0] out;
	
	incrementor incrementorMUT(.in(in), .out(out));

initial begin
	in = 128;
	#10 in = 256;
	#10 $finish;
end

endmodule
