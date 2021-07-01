.text
.global f
.type f, "function"

// X0 - address to the beggining of the sequence
f:		MOV		W2, #0

loop:	LDRB	W3, [X0], #1
		CBZ		W3, end
		CMP		W3, #0x20
		CINC	W2, W2, EQ
		B		loop
		
end:	MOV		W0, W2
		RET