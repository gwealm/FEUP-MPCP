.text
.global b
.type b, "function"

b:      MOV     W0, #7
        SCVTF   S0, W0
        MOV     W1, #10
        SCVTF   S1, W1
        MOV     W0, #71
        SCVTF   S2, W0
        FDIV    S2, S2, S1		// S3 = 7.1
        FSQRT   S2, S2
        FADD    S0, S0, S2
        RET