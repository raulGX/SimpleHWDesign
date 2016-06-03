module control(clk, wen, wsel, asel, bsel, datasel, alusel, eq, resControl, resReg);
	input clk, eq, resControl;
	output [1:0] wen, asel, bsel, alusel;
	output wsel, datasel;
	output [2:0] resReg;
	
	reg [1:0] wen, asel, bsel, alusel;
	reg wsel, datasel;
	reg [2:0] resReg;
	//locals
	reg [3:0] state_crt, state_next;
	
	always@(posedge clk) begin
		if (resControl == 1'b1)
			state_crt <= 0;
		else
			state_crt <= state_next;
	end
	always@(state_crt or eq) begin
		casex({state_crt,eq})
			5'b0000_0 : begin state_next <= 4'b0001; end
			5'b0001_0 : begin state_next <= 4'b0010; end
			5'b0001_1 : begin state_next <= 4'b1010; end
			5'b0010_x : begin state_next <= 4'b0011; end
			5'b0011_x : begin state_next <= 4'b0100; end
			5'b0100_x : begin state_next <= 4'b0101; end
			5'b0101_x : begin state_next <= 4'b0110; end
			5'b0110_x : begin state_next <= 4'b0111; end
			5'b0111_x : begin state_next <= 4'b1000; end
			5'b1000_x : begin state_next <= 4'b1001; end
			5'b1001_x : begin state_next <= 4'b0001; end
			5'b1010_x : begin state_next <= 4'b1010; end
			
			//rest 
			default: begin state_next <= 4'b0001; end 		
		endcase
	end

	always@(state_crt) begin
		case({state_crt})
			
			4'b0000: begin //State 0
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_0_00_00_0_00_111;
				 end
			4'b0001: begin //State 1
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b11_0_00_01_1_00_000;
				 end
			4'b0010: begin //State 2
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_1_00_01_0_00_000; 
				 end
			4'b0011: begin //State 3
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_0_00_10_0_01_000; 
				 end
			4'b0100: begin //State 4
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b10_0_00_10_0_10_000; 
				 end
			4'b0101: begin //State 5 
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_0_00_10_0_01_000; 
				 end
			4'b0110: begin //State 6
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b10_0_00_10_0_10_000; 
				 end
			4'b0111: begin //State 7
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_0_00_10_0_01_000; 
				 end
			4'b1000: begin //State 8
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b10_0_00_10_0_10_000; 	
				 end
			4'b1001: begin //State 9
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b00_0_00_10_0_01_000; 
				 end
			4'b1010: begin //State 10
				 {wen, wsel, asel, bsel, datasel, alusel, resReg} = 13'b11_0_00_10_0_11_000; 
				 end
			
		endcase
	end		
endmodule