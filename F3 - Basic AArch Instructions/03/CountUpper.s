.text
.global CountUpper
.type CountUpper, "function"


CountUpper: 		MOV	X0, 0

			// Inserting 0x0AF008 in X1
			MOV	X1, #0xF008
			MOV	X3, #0xA
			BFI	X1, X3, 16, 4

			// Inserting 0x0BB00F in X5
			MOV	X5, #0xB00F
			MOV	X4, #0xB
			BFI	X5, X4, 16, 4

loop:			CMP	X1, X5
			B.HS	end				// Leaves the loop if the limit has been surpassed
			LDR	X2, [X1]

			CMP	X2, #0x41			// Lower limit
			B.LT	oob				// if out of bounds, jumps to oob

			CMP	X2, #0x5A			// Upper limit
			B.GT	oob				// if out of bounds, jumps to oob

			ADD 	X0, X0, 1

oob:			ADD	X1, X1, 8
			B 	loop

end:			RET
