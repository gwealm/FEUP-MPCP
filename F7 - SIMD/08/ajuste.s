.text
.global ajusteSIMD
.type ajusteSIMD, "function"

// X0 - pointer to the first array (float array)
// X1 - pointer to the second array (float array)
// W2 - length of the arrays
// S0 - float constant `da`
ajusteSIMD: LSR     W2, W2, #2
            FMOV    W3, S0

loop:       CBZ     W2, end
            LDR     Q1, [X0], #16
            LDR     Q2, [X1]
            DUP     V3.4S, W3
            FNEG    V3.4S, V3.4S
            FMUL    V1.4S, V1.4S, V3.4S
            FADD    V2.4S, V1.4S, V2.4S
            STR     Q2, [X1], #16
            SUB     W2, W2, #1
            B       loop

end:        RET