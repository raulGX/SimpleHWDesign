module tb_comparator;

	reg [31:0] in1;
	reg [31:0] in2;
	wire out;
	comparator comparatorMUT(.ina(in1), .inb(in2), .eq(out));

initial begin
	in1 = 40;
	in2 = 20;
	#10 in2 = 40;
	#20 $finish;
end
endmodule
