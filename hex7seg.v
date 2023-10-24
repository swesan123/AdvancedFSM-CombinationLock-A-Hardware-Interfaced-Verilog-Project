module hex7seg(hex, leds);
	
	input [3:1]hex;
	output reg [1:7]leds;
	parameter [3:1] closed = 3'b000, closed2 = 3'b001, open = 3'b010, alarm = 3'b011, new = 3'b100;
	
	always @ (hex)
		case (hex)
			closed: leds = 7'b1111110;
			closed2: leds = 7'b1111100;
			open: leds = 7'b0000001;
			alarm: leds = 7'b0001000;
			new: leds = 7'b1101010;
		endcase
		
		
endmodule
