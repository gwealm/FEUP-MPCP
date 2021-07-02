.text
.global erf
.type erf, "function"

// D0 - x
erf:		STP		X29, X30, [SP, #-16]!
			MOV		X29, SP
			FCMP	D0, #0.0
			B.LT	negative
			BL		erfpos
			B		end

negative:	FNEG	D0, D0
			BL		erfpos
			FNEG	D0, D0

end:		LDP		X29, X30, [SP], #16
			RET