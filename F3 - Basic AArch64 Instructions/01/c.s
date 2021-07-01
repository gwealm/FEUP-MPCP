.text
.global absx15;
.type absx15, "function"

absx15:		CMP		X15, #0
			CNEG	X15, X15, LT
			RET