.text
.global prodintV
.type prodintV, "function"


// X0 - pointer to the first array
// X1 - pointer to the second array
// W2 - length of the arrays
prodintV:	LSR		W2, W2, #2
			MOV		X4, #0		// X4 - stores the result

prodintV:	CBZ		W2, end
			LDR		Q0, [X0], #16
			LDR		Q1, [X1], #16
			MUL		V2.4S, V0.4S, V1.4S
			ADDV	S3, V2.4S
			SMOV	X3, V3.S[0]
			ADD		X4, X3, X4
			SUB		W2, W2, #1
			B		loop

end:		MOV		X0, X4
			RET