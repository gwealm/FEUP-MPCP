.data
.global factorial
factorial: .double 3628800, 4320, 720, 24, 2, 1

.text
.global cosseno
.type cosseno, "function"


// D0 - x
// X0 - pointer to fatorial array
cosseno:	MOV		W1, #6;
			MOV		X2, #1
			SCVTF	D2, X2			// D2 = 1
			LDR		X0, =factorial
			LDR		D3, [X0], #8	// D3 = 10!
			FDIV	D4, D2, D3		// D4 - stores the cos(x) val
			FMUL	D0, D0, D0		// D0 = x^2
			SUB		W1, W1, #1

loop:		CBZ		W1, end
			LDR		D3, [X0], #8
			FDIV	D3, D2, D3			// D3 = 1 / k!, k c {8, 6, 4, 2, 1}
			FMSUB	D4, D4, D0, D3
			SUB		W1, W1, #1
			B		loop

end:		FMOV	D0, D4
			RET