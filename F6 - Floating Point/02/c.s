.text
.global c
.type c, "function"

// S0 - x1
// S1 - y1
// S2 - x2
// S3 - y2
c:      FSUB    S0, S0, S2
        FSUB    S1, S1, S3
        FMUL    S0, S0, S0
        FMUL    S1, S1, S1
        FADD    S0, S0, S1
        FSQRT   S0, S0
        RET