module tb_reg32;
	reg [31:0] din;
	//reg [31:0] dout;
	reg clk, res, pl;
	wire [31:0] dout;

reg32 reg32MUT(.clk(clk), .res(res), .pl(pl), .din(din), .dout(dout));

always #5 clk = ~clk;
initial begin
	clk = 0;
	res = 1;
	pl = 0;
	#10 res = 0;
	#10 pl = 1;
	din = 256;
	#10 pl = 0;
	#10 din = 10;
	#10 pl = 1;
	#10 res = 1;
	#10 $finish;
end

endmodule
