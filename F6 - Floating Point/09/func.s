.data
.global PI
PI:		.double 3.141592653

.text
.global func
.type func, "function"


// D0 - x (degrees)
func:		STP		X29, X30, [SP, #-16]!
			MOV		X29, SP
			LDR		D4, PI

			MOV		X3, #180
			SCVTF	D3, X3
			FMUL	D0, D0, D4
			FDIV	D0, D0, D3

			BL		cosseno

			MOV		X1, #50
			SCVTF	D1, X1			// D1 = 50.0

			MOV		X2, #100
			SCVTF	D2, X2			// D2 = 100.0

			FMADD	D0, D1, D0, D2

			LDP		X29, X30, [SP], #16
			RET