.text
.global e
.type e, "function"

// X0 - pointer to the (int) array
// W1 - length of the array
// W2 - lower bound
// W3 - upper bound

e:		MOV		W4, #0		// W4 - stores the sum result

loop:	CBZ		W1, end
		LDR		W5, [X0], #4
		CMP		W5, W2
		SUB		W1, W1, #1
		B.LT	loop
		CMP		W5, W3
		B.GT	loop
		ADD		W4, W4, #1
		B		loop

end:	MOV		W0, W4
		RET