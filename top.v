module top(clk, in, res);
	input clk;
	input res;
	input [31:0] in;

	wire [1:0] wen;
	wire wsel;
	wire [3:0] decout;
	wire eq;
	
	wire [31:0] r0out;
	wire [31:0] r1out;
	wire [31:0] r2out;
	wire [2:0] resReg;
	
	wire [31:0] muxselout;
	wire [31:0] muxaout;
	wire [31:0] muxbout;
	wire [31:0] muxdataout;

	wire [31:0] incout;
	wire [31:0] addout;
	wire [31:0] sllout;

	wire [1:0] asel;
	wire [1:0] bsel;
	wire [1:0] alusel;
	wire datasel;


	dec14 		dec(.wsel(wsel), .wen(wen), .wout(decout));

	reg32 		R0(.clk(clk), .res(resReg[0]), .pl(decout[0]), .din(muxselout), .dout(r0out));
	reg32 		R1(.clk(clk), .res(resReg[1]), .pl(decout[1]), .din(muxselout), .dout(r1out));
	reg32		R2(.clk(clk), .res(resReg[2]), .pl(decout[2]), .din(muxselout), .dout(r2out));
	
	mux41 		muxA(.ina(r0out), .inb(r1out),.inc(r2out), .ind(32'b0), .sel(asel), .out(muxaout));
	mux41 		muxB(.ina(r0out), .inb(r1out),.inc(r2out), .ind(32'b0), .sel(bsel), .out(muxbout));
	mux41 		muxSel(.ina(incout), .inb(addout),.inc(sllout), .ind(32'b0), .sel(alusel), .out(muxselout));
	mux21 		muxData(.ina(muxaout), .inb(in), .sel(datasel), .out(muxdataout));

	incrementor 	inc(.in(muxbout), .out(incout));
	adder 		add(.ina(muxdataout), .inb(muxbout), .out(addout));
	sll		shifter(.in(muxbout), .out(sllout));

	comparator 	comp(.ina(muxdataout), .inb(muxbout), .eq(eq));
	
	control controller(.clk(clk), .wen(wen), .wsel(wsel), .asel(asel), .bsel(bsel), .datasel(datasel), .alusel(alusel), .eq(eq), .resControl(res), .resReg(resReg));
	
endmodule
