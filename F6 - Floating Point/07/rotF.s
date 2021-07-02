.data
.global PI
PI:	.double 3.141592653

.text
.global rotF
.type rotF, "function"

// D0 - x value
rotF:		LDR		D2, PI		// D2 = 3.1415... (PI)
			FCMP	D0, #0.0
			B.LT	less
			FADD	D0, D2, D0
			FMOV	D1, D0
			FMUL	D0, D0, D0
			FMUL	D0, D0, D1
			B		end

less:		MOV		X4, #4
			SCVTF	D3, X4		// D3 = 4.0
			MOV		X5, #1
			SCVTF	D5, X5		// D5 = 1.0
			FSUB	D0, D3, D0
			FSQRT	D0, D0
			FDIV	D0, D5, D0

end:		RET