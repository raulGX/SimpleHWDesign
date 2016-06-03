module tb_dec14;
	reg wsel;
	reg [1:0] wen;
	wire [3:0] wout;
dec14 dec14MUT(.wsel(wsel), .wen(wen), .wout(wout));
initial begin
	wsel = 0;
	wen = 0;
	#10 wen = 1;
	#10 wen = 2;
	#10 wen = 3;
	#10 wsel = 1;
	#10 wen = 0;
	#10 $finish;
end

endmodule