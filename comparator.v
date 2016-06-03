module comparator(ina, inb, eq);

	input [31:0] ina;
	input [31:0] inb;

	output eq;

	assign eq = (ina == inb);
endmodule
