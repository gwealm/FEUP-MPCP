.text
.global b
.type b, "function"

// X0 - pointer to the array
// W1 - length of the array

b:		CBZ		W1, end
		LDR		X3, [X0], #8
		SUB		W1, W1, #1

loop:	CBZ		W1, end
		LDR		X4, [X0], #8
		CMP		X4, X3
		CSEL	X3, X4, X3, LT
		SUB		W1, W1, #1
		B		loop

end:	MOV		X0, X3
		RET