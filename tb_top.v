module tb_top;
	reg [31:0] in;
	reg clk;
	reg res;
	always #5 clk = ~clk;
	top topMUT(.clk(clk), .in(in), .res(res));
initial begin
	in = 20;
	res = 1;
	clk = 0;
	#10 res = 0;
	#10000 $finish;
end

endmodule
