.text
.global a
.type a, "function"

a:		MOV		X12, X10
		BFI		X12, X10, #8, #8
		MOV		X13, #0xFFFFFFFFFFFFFF00
		AND		X12, X12, X13
		RET