.text
.global calc_poly_tab
.type calc_poly_tab, "function"

// X0 - pointer to the array which stores the result
calc_poly_tab:	MOV		W1, #101
                MOV		W2, #15
                MOV		W3, #125
                MOV		W4, #7
                MOV		W5, #10
                MOV		W6, #1
                SCVTF	S2, W2
                SCVTF	S3, W3
                SCVTF	S4, W4				// S4 = 7.0
                SCVTF	S6, W6
                SCVTF	S5, W5
                FDIV	S2, S2, S5			// S2 = 1.5
                FDIV	S3, S3, S5			// S3 = 12.5
                FDIV	S6, S6, S5			// S6 = 0.1
                FSUB	S7, S7, S7			// S7 = 0


loop:	        CBZ		W1, end
                FMOV	S16, S7				// S16 = x
                FMUL	S17, S7, S7
                FMUL	S17, S17, S16		// S17 = x^3
                FMSUB	S18, S3, S16, S4
                FMUL	S17, S17, S2
                FADD	S17, S17, S18		// S17 = 1.5*x^3 - 12.5*x + 7
                STR		S17, [X0], #4
                FADD	S7, S7, S6
                SUB		W1, W1, #1
                B		loop

end:	        RET