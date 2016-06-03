module tb_control;
	reg clk, eq, resControl;
	wire [1:0] wen, asel, bsel, alusel;
	wire wsel, datasel;
	wire [2:0] resReg;
	always #5 clk = ~clk;
control controlMut(.clk(clk), .wen(wen), .wsel(wsel), .asel(asel), .bsel(bsel), .datasel(datasel), .alusel(alusel), .eq(eq), .resControl(resControl), .resReg(resReg));
initial begin
	clk = 0;
	eq = 0;
	resControl = 0;
	#120 eq = 1;
	#100 $finish;
end

endmodule