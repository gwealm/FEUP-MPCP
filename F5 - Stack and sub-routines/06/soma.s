.text
.global SOMA
.type SOMA, "function"

// X0 - pointer to array 1
// W1 - size of array 1

SOMA:   STP     X29, X30, [SP, #-32]!
        MOV     X29, SP
        STR     X19, [SP, #16]
        STP     W20, W21, [SP, #24]

        MOV     X19, X0                 // X19 - pointer to array 1
        MOV     W20, W1                 // W20 - size of array 1
        MOV     W21, #0                 // W21 - stores the result

loop:   CBZ     W20, end
        LDR     W9, [X19], #4
        ADD     W21, W21, W9
        SUB     W20, W20, #1
        B       loop

end:    MOV     W0, W21
        LDR     X19, [SP, #16]
        LDP     W20, W21, [SP, #24]
        LDP     X29, X30, [SP], #32
        RET