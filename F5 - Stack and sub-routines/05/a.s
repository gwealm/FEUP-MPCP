.text
.global a
.type a, "function"

// X0 - address of the char array
a:          MOV     X5, X0
            MOV     W4, #0

loop:       LDRB    W1, [X0], #1
            CBZ     W1, invert
            STRB    W1, [SP, #-16]!
            ADD     W4, W4, #1
            B       loop

invert:     CBZ     W4, end
            LDRB    W1, [SP], #16
            STRB    W1, [X5], #1
            SUB     W4, W4, #1
            B       invert

end:        RET