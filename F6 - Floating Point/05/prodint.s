.text
.global prodint
.type prodint, "function"

// X0 - pointer do the x's array
// X1 - pointer do the y's array
// W2 - length of the arrays
prodint:	FSUB	D0, D0, D0

loop:		CBZ		W2, end
			LDR		S1, [X0], #4
			LDR		S2, [X1], #4
			FCVT	D1, S1
			FCVT	D2, S2
			FMADD	D0, D1, D2, D0
			SUB		W2, W2, #1
			B		loop

end:		RET
