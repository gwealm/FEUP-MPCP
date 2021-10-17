.text
.global HORNER
.type HORNER, "function"

// D0 - x value
// X0 - pointer do the coef array
// W1 - length of the array
HORNER:     MOV     W2, #0      // counter
            FSUB    D3, D3, D3  // D3 - stores the result

            SUB     W3, W1, W2
            SXTW    X3, W3
            LDR     D1, [X0, X3]
            ADD     W2, W2, #1
            FMOV    D3, D1

loop:       CBZ     W1, end
            SUB     W3, W1, W2
            SXTW    X3, W3
            LDR     D1, [X0, X3]
            FMADD   D4, D3, D0, D1
            FMOV    D3, D4
            ADD     W2, W2, #1
            SUB     W1, W1, #1
            B       loop

end:        FMOV	D0, D3
            RET