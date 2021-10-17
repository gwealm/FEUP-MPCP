.text
.global a
.type a, "function"

// X0 - address to the beggining of the sequence
a:      MOV     W2, #0

loop:   LDRB    W1, [X0], #1
        CBZ     W1, end
        ADD     W2, W2, #1
        B       loop

end:    MOV	W0, W2
        RET
