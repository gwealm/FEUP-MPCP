.text
.global test
.type test, "function"

// X0 - pointer to the first array (float array)
// X1 - size of the array
// S0 - limit
test:		LSR		X1, X1, #2
			MOV		X3, #0			// X3 - stores the result
			FMOV 	W6, S0
			MOV		W7, #0xFFFFFFFF


loop:		CBZ		X1, end
			LDR		Q0, [X0], #16
			DUP		V1.4S, W6
			DUP		V2.4S, W7
			FCMGE	V3.4S, V0.4S, V1.4S
			EOR		V3.16B, V3.16B, V2.16B
			ABS		V3.4S, V3.4S
			ADDV	S4, V3.4S
			UMOV	W4, V4.S[0]
			ADD		X3, X3, W4, sxtw
			SUB		X1, X1, #1
			B		loop

end:		MOV		X0, X3
			RET