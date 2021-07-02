.text
.global msubV
.type msubV, "function"


// X0 - pointer to the first array
// X1 - pointer to the second array
// X2 - pointer to the third array
// W3 - length of the arrays
// S0 - Scalar k
msubV:		STP		X29, X30, [SP, -64]!
			MOV		X29, SP
			STP		X19, X20, [SP, #16]
			STR		X21, [SP, #32]
			STR		W22, [SP, #40]
			STR		S8, [SP, #48]
			
			MOV		X19, X0			// X19 - pointer to the first array
			MOV		X20, X1			// X20 - pointer to the second array
			MOV		X21, X2			// X21 - pointer to the third array
			MOV		W22, W3			// W22 - length of the arrays
			MOV		S8, S0			// S8  - Scalar k

			// call to altV (-k * Q)
			FNEG	S0, S0
			MOV		X0, X20
			MOV		W1, W22
			BL		altV
			
			// call to somaV (P -k * Q)
			MOV		X1, X19
			MOV		X2, X21
			MOV		W3, W22
			BL		somaV
			
			RET