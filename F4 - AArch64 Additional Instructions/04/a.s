.text
.global a
.type a, "function"

// X0 - address to the beggining of the first sequence
// W1 - length of the sequence
// X2 - address to the beggining of the second sequence
a:		CBZ		W1, end
		LDRB	W3, [X0], #1
		SXTB	X3, W3
		STR		X3, [X2], #8
		SUB		W1, W1, #1
		B		a

end:	RET
