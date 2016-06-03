module tb_mux41;

	reg [31:0] in1;
	reg [31:0] in2;
	reg [31:0] in3;
	reg [31:0] in4;
	reg [1:0] sel;
	wire [31:0] out;
	mux41 mux41MUT(.ina(in1), .inb(in2),.inc(in3), .ind(in4), .sel(sel), .out(out));

initial begin
	in1 = 10;
	in2 = 20;
	in3 = 30;
	in4 = 40;
	sel = 2'b0;
	#10 sel = 2'b01;
	#10 sel = 2'b10;
	#10 sel = 2'b11;
	#20 $finish;
end
endmodule
