.data
.global PI
PI:	.float 3.1415

.text
.global conta_intervalo
.type conta_intervalo, "function"

// X0 - pointer to the array
// X1 - size of the array
// S0 - lower bound
// S1 - upper bound
conta_intervalo:    MOV     X3, #0

loop:               CBZ     X1, end
                    LDR     S2, [X0], #4
                    SUB     X1, X1, #1
                    FCMP    S2, S0
                    B.LT    loop
                    FCMP    S2, S1
                    B.GT    loop
                    ADD     X3, X3, #1
                    B       loop

end:				MOV     X0, X3
                    RET