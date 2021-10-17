.text
.global c
.type c, "function"

// X0 - address to the beggining of the sequence
// X1 - address to the beggining of the vowels sequence
c:          MOV     W3, #0

loop:       LDRB    W2, [X0], #1
            CBZ     W2, end
            MOV     X4, X1			// X4 - copy of vowel sequence address

is_vowel:   LDRB    W5, [X4], #1
            CBZ     W5, loop
            CMP     W2, W5
            CINC    W3, W3, EQ
            B       is_vowel

end:        MOV     W0, W3
            RET
