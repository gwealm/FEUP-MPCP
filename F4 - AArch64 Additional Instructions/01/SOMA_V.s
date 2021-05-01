.text
.global SOMA_V
.type SOMA_V, "function"

SOMA_V:		MOV		W2, 0			// stub to store the sum

// iterating through the array
loop:		CBZ		W1, end			// if (X1 == 0) {goto end;}

			LDR		W3, [X0]		// getting the value from the array

			ADD		W2, W2, W3

			ADD		W0, W0, 4		// updating address
			SUB		W1, W1, 1		// decrementing iterations-left counter
			B		loop

end:		MOV		W0, W2
