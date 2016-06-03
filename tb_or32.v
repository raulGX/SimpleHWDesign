module tb_or32;
	reg [31:0] in1;
	reg [31:0] in2;
	wire [31:0] out;

or32 or32Mut(.ina(in1), .inb(in2), .out(out));

initial begin
	in1 = 10;
	in2 = 0;
	#10 in2 = 32'hfffffff;
	#10 $finish;
end

endmodule
