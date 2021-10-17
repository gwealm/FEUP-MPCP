.text
.global b
.type b, "function"

// X0 - address to the beggining of the sequence
// W1 - char to be searched
b:      MOV     W3, #0

loop:   LDRB    W2, [X0], #1
        CBZ     W2, end
        CMP     W2, W1
        CINC    W3, W3, EQ
        B       loop

end:    MOV     W0, W3
        RET