.data
.global PI
PI:	.double 3.141592653

.text
.global b
.type b, "function"

// D0 - radius
b:		LDR		D1, PI
		FMUL	D0, D0, D0
		FMUL	D0, D1, D0
		RET