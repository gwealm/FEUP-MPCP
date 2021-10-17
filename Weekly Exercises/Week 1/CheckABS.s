.text
.global CheckABS
.type CheckABS, "function"


CheckABS:       MOV     W4, WZR                     // Modified values = 0

loop:           CBZ     W1, end                     // When fully iterated through, ends the loop
                LDR     W3, [X2]            		// Passes the current sequence value to W3

                CMP     W3, WZR
                CNEG    W3, W3, LT                	// abs(W3)
                CMP     W3, W0                  	// Compares abs(W3) with W0
                SUB     W1, W1, 1                	// Decrementing iterations left counter
                B.GT    changetozero   		        // If abs(W3) > W0, jumps to changetozero
                ADD     X2, X2, 4
                B       loop                 	    // New iteration

changetozero:   STR     WZR, [X2]                	// Substitutes the current sequence value with 0
                ADD     X2, X2, 4
                ADD     W4, W4, 1                	// Modified values += 1
                B       loop                    	// New iteration

end:            MOV     W0, W4                    	// Passes the modified values counter to W0 (to be returned)
                RET
