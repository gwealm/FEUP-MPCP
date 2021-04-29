.text
.global ContPar
.type ContPar, "function"

ContPar:		MOV	X3, 0			// Evens counter

loop:			CBZ	X1, end2		// Checks if the vector has been fully traversed
			LDR	X2, [X0]

			/*
			 * The next 3 logic operations check if the number is even or odd
			 * If even X2 (1) is added
			 * If odd X2 (0) is added
			 */
			AND 	X2, X2, 1
			EOR     X2, X2, 1
			ADD	X3, X3, X2


			ADD	X0, X0, 8		// Update the memory address to be accessed on the next iteration
			SUB	X1, X1, 1
			B	loop

end2:			MOV 	X0, X3
			RET
