.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"


SelectedUpperCase:		MOV		X5, 0				// Initializing the register to store the counter

loop1:					LDRB	W2, [X0], 1			// Passing the char of the "forbidden sequence" to X2
						CBZ		W2, end
						MOV		X3, X1				// Pass a copy of X1, to X3 (to modify it and keep X1's integrity)

loop2:					LDRB	W4,[X3], 1			// Passing a main sequence char to X4
						CBZ		W4, loop1
						CMP		W2, W4
						B.EQ	match
						CINC	W5, W5, EQ			// if (W2 == W4) {W5++};
						B		loop2

match:					ADD		W5, W5, 1			// increment counter
						SUB		W4, W4, 32			// pass lower to upper case
						STRB	W4, [X3, -1]
						B		loop2

end:					MOV		W0, W5
						RET