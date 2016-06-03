module mux21(ina, inb, sel, out);

	input [31:0] ina;
	input [31:0] inb;
	
	input sel;

	output [31:0] out;
	
	assign out = 	(sel == 1'b00) ? ina : inb;				
endmodule
