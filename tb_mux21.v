module tb_mux21;

	reg [31:0] in1;
	reg [31:0] in2;
	reg sel;
	wire [31:0] out;
	mux21 mux21MUT(.ina(in1), .inb(in2), .sel(sel), .out(out));

initial begin
	in1 = 40;
	in2 = 20;
	sel = 1'b0;
	#10 sel = 1'b1;
	#20 $finish;
end
endmodule
