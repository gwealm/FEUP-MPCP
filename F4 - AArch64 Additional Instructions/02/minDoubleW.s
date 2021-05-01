.text
.global minDoubleW
.type minDoubleW, "function"

minDoubleW:	MOV		X3, XZR

loop:		CBZ		X1, end
			LDR		X2, [X0], #8
			CMP		X2, X3
			SUB		X1, X1, 1
			B.LT	lower
			B		loop

lower:		MOV		X3, X2
			B		loop

end:		MOV		X0, X3
			RET
