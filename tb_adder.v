module tb_adder;

	reg [31:0] in1;
	reg [31:0] in2;
	wire [31:0] out;
	adder adderMUT(.ina(in1), .inb(in2), .out(out));

initial begin
	in1 = 40;
	in2 = 20;
	#10 $finish;
end

endmodule