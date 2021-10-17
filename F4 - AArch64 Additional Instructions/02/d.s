.text
.global d
.type d, "function"

// X0 - pointer to the array
// W1 - length of the array

d:      MOV     X3, #0
        SUB     D1, D1, D1
        SCVTF   S1, W1

loop:   CBZ     W1, #0
        LDR     X4, [X0], #8
        ADD     X3, X3, X4
        SUB     W1, W1, #1
        B       loop

end:    SCVTF   D0, X3
        FDIV    D0, D0, D1
        RET