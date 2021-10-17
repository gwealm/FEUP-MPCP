.text
.global a
.type a, "function"

a:      MOV     W0, #78
        MOV     W1, #10
        SCVTF   S0, W0
        SCVTF   S1, W1
        FDIV    S0, S0, S1		// S0 = 7.8
        MOV     W0, #36
        SCVTF   S2, W0
        FDIV    S2, S2, S1		// S2 = 3.6
        MOV     W0, #71
        SCVTF   S3, W0
        FDIV    S3, S3, S1		// S3 = 7.1

        FADD    S2, S2, S3
        FNMUL   S0, S0, S2
        RET