.text
.global d
.type d, "function"

// X0 - address to the beggining of the sequence
d:          MOV     W3, #0

loop:       LDRB    W2, [X0], #1
            CBZ     W2, end
            CMP     W2, #0x41
            B.LT    loop
            CMP     W2, #0x5A
            B.GT    loop
            ADD     W3, W3, #1
            B       loop
			
end:        MOV     W0, W3
            RET