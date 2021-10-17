.text
.global table
.type table, "function"

// X0 - pointer to the array which stores the results
table:      STP     X29, X30, [SP, #-48]!
            MOV     X29, SP
            STP     D8, D9, [SP, #16]
            STR     D10, [SP, #32]
            STR     X19, [SP, #40]

            SUB     D8, D8, D8      // D8 = 0
            MOV     X1, #91
            SCVTF   D9, X1          // D9 = 90
            MOV     X2, #1
            SCVTF   D10, X2         // D10 = 1
            MOV     X19, X0

loop:       FCMP    D8, D9
            B.EQ    end
            FMOV    D0, D8
            BL      func
            STR     D0, [X19], #8
            FADD    D8, D8, D10
            B       loop

end:        LDP     D8, D9, [SP, #16]
            LDR     D10, [SP, #32]
            LDR     X19, [SP, #40]
            LDP     X29, X30, [SP], #48
            RET