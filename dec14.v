module dec14(wsel, wen, wout);
	input wsel;
	input [1:0] wen;
	output [3:0] wout;
	reg [3:0] wout;
	always@(wen or wsel) begin
		if (wsel == 1'b0)
			assign wout = (wen == 2'b00)? 4'b0001 : (wen == 2'b01)? 4'b0010 : (wen == 2'b10)? 4'b0100 : 4'b1000;
		else
			assign wout = 4'b0110;//setez b in r1, r2 dupa incrementare
	end
endmodule
