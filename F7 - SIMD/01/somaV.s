.text
.global somaV
.type somaV, "function"


// X0 - pointer to the first array
// X1 - pointer to the second array
// X2 - pointer to the result array
// W3 - length of the arrays
somaV:		LSR		W3, W3, #2		// W3 - number of iterations

loop:		CBZ		W3, end
			LDR		Q0, [X0], #16
			LDR		Q1, [X1], #16
			FADD	V2.4S, V1.4S, V0.4S
			STR		Q2, [X2], #16
			SUB		W3, W3, #1
			B		loop

end:		RET
