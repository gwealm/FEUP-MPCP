.text
.global MEDIA
.type MEDIA, "function"

// X0 - pointer to array 1
// W1 - size of array 1

MEDIA:      STP     X29, X30, [SP, #-32]!
            MOV     X29, SP
            STR     X19, [SP, #16]
            STP     W20, W21, [SP, #24]

            MOV     X19, X0                 // X19 - pointer to array 1
            MOV     W20, W1                 // W20 - size of array 1
            MOV     W21, #0                 // W21 - stores the result

            BL      SOMA                    // W0 - sum of the array elements

end:        SCVTF   S0, W0
            SCVTF   S1, W20
            FDIV    S0, S0, S1

            LDR     X19, [SP, #16]
            LDP     W20, W21, [SP, #24]
            LDP     X29, X30, [SP], #32
            RET