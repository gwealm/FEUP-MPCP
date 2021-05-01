.text
.global average
.type average, "function"

average:		MOV		X3, 0
				MOV		X4, X1

loop:			CBZ		X1, end
				LDR		X2, [X0], #8
				ADD		X3, X3, X2
				SUB		X1, X1, 1
				B		loop

end:			SDIV	X0, X3, X4
				RET
