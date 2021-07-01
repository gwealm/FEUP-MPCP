.text
.global SOMA_V
.type SOMA_V, "function"

SOMA_V:		MOV		W4, #0

loop:		CBZ		W1, end
			LDR		W3, [X0], #4
			ADD		W4, W4, W3
			SUB		W1, W1, #1
			B		loop

end:		MOV		W0, W4
			RET

// Alterações:
// - Trocar W3 por X3
// - Trocar W4 por X4
// - Trocar W0 por X0