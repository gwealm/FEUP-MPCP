.text
.global fa
.type fa, "function"

fa:         MOV     X7, #0

loop:       CBZ     X3, end
            AND     X4, X3, #31
            CMP     X4, #22
            LSR     X3, X3, #1
            B.NE    loop
            ADD     X7, X7, #1
            B       loop

end:        RET