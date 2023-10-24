module simple (Clock, w, z);

	input Clock, w;
	output z;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;
	
// Define the next state combinational circuit
	always @ (w, y)
		case (y)
			A: if (w) 	Y = B;
				else 		Y = A;
			B: if (w) 	Y = C;
				else 		Y = A;
			C: if (w) 	Y = C;
				else 		Y = A;
			default: 	Y = 2'bxx;
		endcase

// Define the sequential block
	always @ (posedge Clock)
		y <= Y;

// Define output
	assign z = (y == B);

endmodule
