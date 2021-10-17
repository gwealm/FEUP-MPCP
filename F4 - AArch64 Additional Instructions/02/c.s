.text
.global c
.type c, "function"

// X0 - pointer to the array
// W1 - length of the array

c:      MOV     W3, #0

loop:   CBZ     W1, #0
        LDRB    W4, [X0], #2
        CMP     W4, W3
        CSEL    W3, W4, W3, GT
        SUB     W1, W1, #1
        B       loop

end:    MOV     W0, W3
        RET