.text
.global valuesBetween
.type valuesBetween, "function"

valuesBetween:		MOV		X5, XZR

loop:				CBZ		X1, end
					LDR		X4, [X0], #8
					CMP		X4, X2
					SUB		X1, X1, 1
					B.LT	loop
					CMP		X4, X3
					B.GT	loop
					ADD		X5, X5, 1
					B		loop

end:				MOV		X0, X5
					RET
