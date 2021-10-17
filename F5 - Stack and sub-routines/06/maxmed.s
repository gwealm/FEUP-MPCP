.text
.global MAXMED
.type MAXMED, "function"

// X0 - pointer to array 1
// W1 - size of the first array
// X2 - pointer to array 2
// W3 - size of the second array

MAXMED:     STP     X29, X30, [SP, #-48]!
            STP     X19, X20, [SP, #16]
            STP     W21, W22, [SP, #32]
            STP     S8, S9, [SP, #40]


            MOV     X19, X0                 // X19 - pointer to array 1
            MOV     X20, X2                 // X20 - pointer to array 2
            MOV     W21, W1                 // W21 - size of array 1
            MOV     W22, W3                 // W22 - size of array 2
            FSUB    S8, S8, S8              // S8 - stores the med of array 1
            FSUB    S9, S9, S9              // S9 - stores the med of array 2

            BL      MEDIA
            FMOV    S8, S0

            MOV     X0, X20
            MOV     W1, W22
            BL      MEDIA
            FMOV    S9, S0

            FCMP    S8, S9
            FCSEL   S0, S8, S9, GE

            LDP     X19, X20, [SP, #16]
            LDP     W21, W22, [SP, #32]
            LDP     S8, S9, [SP, #40]
            LDP     X29, X30, [SP], #48

            RET