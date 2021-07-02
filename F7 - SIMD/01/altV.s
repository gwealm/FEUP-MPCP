.text
.global altV
.type altV, "function"


// X0 - pointer to the first array
// W1 - length of the array
// S0 - scalar K
altV:		LSR		W3, W1, #2		// W3 - number of iterations
			FMOV	W4, S0

loop:		CBZ		W3, end
			LDR		Q1, [X0]
			DUP		V2.4S, W4
			FMUL	V1.4S, V1.4S, V2.4S
			STR		Q1, [X0], #16
			SUB		W3, W3, #1
			B		loop

end:		RET
