.text
.global e
.type e, "function"

// X0 - address to the beggining of the sequence
// W1 - length of the word
e:          MOV     W3, #1
            ADD     X4, X0, W1, sxtw		// end address of the string
            SUB     X4, X4, #1

loop:       CBZ     W1, end
            LDRB    W5, [X0], #1
            LDRB    W6, [X4], #-1
            CMP     W5, W6
            B.NE    not_pal
            SUB     W1, W1, #1
            B       loop

not_pal:    MOV     W3, #0

end:        MOV     W0, W3
            RET