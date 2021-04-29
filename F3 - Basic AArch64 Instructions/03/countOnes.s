.text
.global COUNT_ONES
.type COUNT_ONES, "function"

COUNT_ONES:		MOV	X7, 0

loop:			ORR	X1, X0, XZR			// Checking if the number has more 1's
			CBZ	X1, end
			AND	X1, X1, 1			// Getting last bit
			ADD	X7,	X7, X1			// Sums the last bit to X7 (0 or 1)
			LSR	X0, X0, 1
			B	loop

end:			MOV	X0, X7
			RET
