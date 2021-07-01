.text
.global decmemby1
.type decmemby1, "function"

decmemby1:	LDR 	X0, [X10]
			SUB 	X0, X0, 1
			STR 	X0, [X10]
			RET