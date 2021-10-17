.text
.global a
.type a, "function"

// X0 - address of vector 1
// X1 - address of vector 2
// W2 - size of vectors
a:      MOV     W3, #0

loop:   CBZ     W1, end
        LDR     W4, [X0]
        LDR     W5, [X1], #4
        ADD     W4, W4, W5
        STR     W4, [X0]
        ADD     X0, X0, #4
        SUB     W1, W1, #1
        B       loop

end:    RET