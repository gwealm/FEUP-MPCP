.text
.global histo
.type histo, "function"

histo:  MOV     W7, W0
        LSR     X0, X0, 4
        MOV     W4, 0


loop:   CBZ     X0, end
        MOV     W5, 21
        SUB     X0, X0, 1

loop2:  CBZ     X5, loop
        SUB     W5, W5, 1
        LSL     W9, W0, 4
        LDR     Q0, [X1, X9]
        DUP     V1.16B, W5
        CMEQ    V2.16B, V0.16B, V1.16B
        ABS     V2.16B, V2.16B
        ADDV    B6, V2.16B

        UMOV    W6, V6.B[0]
        MUL     W6, W5,W6
        ADD     W4, W4, W6
        LDR     B7, [X2, X5]
        ADD     V6.16B, V6.16B, V7.16B
        STR     B6, [X2, X5]

        B       loop2

end:    UCVTF   S4, W4
        UCVTF   S7, W7
        FDIV    S0, S4, S7
        RET