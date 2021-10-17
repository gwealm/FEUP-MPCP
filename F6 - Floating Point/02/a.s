.text
.global a
.type a, "function"

// S0 - A
// S1 - B
// S2 - C
// S3 - D
a:      FSUB    S4, S0, S1
        FMUL    S4, S4, S2			// S4 = (A-B)*C
        FADD    S5, S0, S3
        MOV     W0, #3
        SCVTF   S6, W0
        FSUB    S5, S5, S6			// S5 = D+A-3
        FDIV    S0, S4, S5
        RET
