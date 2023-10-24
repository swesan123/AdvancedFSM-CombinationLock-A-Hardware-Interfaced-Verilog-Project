module lock (Clock, Resetn, X, changePress, enterPress, changePulse, enterPulse, leds);

	input [3:0] X;
	input Clock, Resetn, changePress, enterPress;
	reg [3:0] lockCombo = 4'b0110;
	reg [3:1] y, Y;
	output enterPulse, changePulse;
	output [1:7] leds;
	parameter [3:1] closed = 3'b000, closed2 = 3'b001, open = 3'b010, alarm = 3'b011, new = 3'b100;

	simple change(Clock, changePress, changePulse);
	simple enter(Clock, enterPress, enterPulse);
	hex7seg out(y, leds);
	
	always @ (enterPulse, changePulse, Resetn, y)
		case (y)
			closed:	if (enterPulse == 1)
							if (lockCombo == X)
								Y = open;
							else
								Y = closed2;
						else if (changePulse == 1)
							if (lockCombo == X)
								Y = new;
							else
								Y = closed2;
								
			closed2: if (enterPulse == 1)
							if (lockCombo == X)
								Y = open;
							else
								Y = alarm;
						else if (changePulse == 1)
							if (lockCombo == X)
								Y = new;
							else
								Y = alarm;
						
			open:	if (enterPulse == 1)
						Y = closed;
						
			alarm:	if (Resetn == 0)
						begin
							lockCombo = 4'b0110;
							Y = closed;
						end
	
			new:	if (enterPulse == 1 || changePulse == 1)
					begin
						lockCombo = X;
						Y = closed;
					end
			
			default: Y = closed;
		endcase

	always @(posedge Clock)
		y <= Y;

endmodule
