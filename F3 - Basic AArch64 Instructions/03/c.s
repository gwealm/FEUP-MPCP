.text
.global ContPar
.type ContPar, "function"

ContPar:    MOV    X7, #0

loop:       CBZ    X1, end
            LDR    W2, [X0], #4
            AND    W3, W2, #1
            EOR    W3, W3, #1
            ADD    X7, X7, W3, sxtw
            SUB    X1, X1, #1
            B      loop

end:        RET