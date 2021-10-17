.text
.global prod_complexosV
.type prod_complexosV, "function"


// X0 - pointer to the first array (float array)
// X1 - pointer to the second array (float array)
// X2 - pointer to the third array (float array)
// X3 - length of the arrays
prod_complexosV:    LSR     X3, X3, #2
                    MOV     X4, #0x00000001FFFFFFFF
                    DUP     V4.2D, X4

loop:               CBZ     X3, end
                    LDR     Q0, [X0], #16
                    LDR     Q1, [X1], #16
                    FMUL    V2.4S, V0.4S, V1.4S
                    REV64   V1.4S, V1.4S
                    FMUL    V5.4S, V2.4S, V4.4S
                    FADDP   V5.4S, V5.4S, V3.4S
                    MOV     W5, V5.S[2]
                    INS     V5.S[2], V5.S[1]
                    MOV     V5.S[1], W5
                    SUB     X3, X3, #1
                    STR     Q5, [X2], #16
                    B       loop

end:                RET