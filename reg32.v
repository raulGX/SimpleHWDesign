module reg32(clk, res, pl, din, dout);
	input clk, res, pl;
	input [31:0] din;
	
	output [31:0] dout;
	reg [31:0] dout;
	
	always@(res) begin
		if (res==1'b1)
			dout <= 0;
	end
	always@(posedge clk) begin
		if (res==0)
			if (pl==1'b1)
				dout <= din;
			else
				dout <= dout;
		else
			dout <= 0;
	end
endmodule
