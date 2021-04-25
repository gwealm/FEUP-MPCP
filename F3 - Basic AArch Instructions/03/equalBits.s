.text
.global EQUAL_BITS
.type EQUAL_BITS, "function"

EQUAL_BITS:		MOV		X7, 0
			EON		X0, X0, X1
			BL		COUNT_ONES
			RET
