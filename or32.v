module or32(ina, inb, out);
	input [31:0] ina;
	input [31:0] inb;
	output [31:0] out;

	assign out = ina | inb;
endmodule;
