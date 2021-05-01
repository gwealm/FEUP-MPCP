.text
.global maxHalf
.type maxHalf, "function"

maxHalf:	MOV		W3, WZR

loop:		CBZ		W1, end
			LDRSH	W2, [X0], #2
			CMP		W2, W3
			SUB		W1, W1, 1
			B.GT	greater
			B		loop

greater:	MOV		W3, W2
			B		loop

end:		MOV		W0, W3
			RET
