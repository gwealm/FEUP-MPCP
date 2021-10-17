.text
.global OpMat
.type OpMat, "function"

/*
Arguments:
    W0 -> NCOL
    W1 -> NLIN
    X2 -> base address of ops
    X3 -> main matrix

Ascii:
    L: 76
    C: 67
    P: 80
    B: 66
    O: 79
    X: 88

    X9-X15 -> Use freely in OpMat
*/


OpMat:      MOV     W4, 0       // will act as a flag ( 0 if passed by 'O')


loop:       MOV     W10, W0     // copy of ncols
            MOV     W11, W1     // copy of nlines
            MOV     X12, X3     // copy of matrix address

            LDRB    W9, [X2], 1 // getting the operation
            CMP     W9, 88      // 'X'
            B.EQ    fix
            CMP     W9, 76      // 'L'
            B.EQ    L
            CMP     W9, 67      // 'C'
            B.EQ    C
            CMP     W9, 80      // 'P'
            B.EQ    P
            CMP     W9, 66      // 'B'
            B.EQ    B
            CMP     W9, 79      // 'O' (subroutine)
            B.EQ    prep
            B       loop

fix:        CBNZ    W4, fix2
            MOV     W0, -1
            B       end

fix2:       MOV     W0, W5

end:
            RET


// Prepares the registers to call `ocorr`
prep:       MOV     W4, 2                   // flags going into subroutine 'O'
            LDRB    W9, [X2], 1             // value to search for
            STP     X29, X30, [sp, -48]!
            STR     X3, [SP, 16]
            STR     X2, [SP, 24]
            STRB    W1, [SP, 32]
            STRB    W0, [SP, 33]
            STRB    W4, [SP, 34]
            MUL     W2, W0, W1              // size of the vector
            MOV     W0, W9                  // value to search for
            MOV     X1, X3                  // base address of matrix
            MOV     X29, SP

            //STP       W3, W2, [sp, 16]
            //STP       W1, W0, [sp, 32]
            BL      ocorr
            MOV     W5, W0
            LDR     X3, [SP, 16]
            LDR     X2, [SP, 24]
            LDRB    W1, [SP, 32]
            LDRB    W0, [SP, 33]
            LDRB    W4, [SP, 34]
            LDP     X29, X30, [SP], 48
            B       loop


/* Subroutine that makes the operation 'L'
    Format: 'L', lin, n
    Changes all the values in `lin` line to n
*/
L:          MOV     X13, 0
            LDRB    W9, [X2], 1                 // W9  -> lin
            LDRB    W11, [X2], 1                // W11 -> n
            UMULL   X13, W9, W0                 // ncol * lin
            SUB     W10, W10, 1		
// The values are changed in reverse order ( end to start )
loopL:      CMP     W10, 0
            B.LT    loop                        // X10 < 0
            ADD	    X14, X13, W10, sxtw
            STRB    W11, [X3, X14]
            SUB     W10, W10, 1
            B       loopL


/* Subroutine that makes the operation 'C'
    Format: 'C', col, n
    Changes all the values in `col` column to n
*/
C:          MOV     X13, 0
            LDRB    W9, [X2], 1                 // W9  -> col
            LDRB    W10, [X2], 1                // W10 -> n
            SUB     W11, W11, 1		
// The values are changed in reverse order ( end to start )
loopC:      CMP     W11, 0
            B.LT    loop                        // X10 < 0
            UMULL   X13, W11, W0                // lin * ncol
            ADD     X15, X13, W9, sxtw
            STRB    W10, [X3, X15]              // (lin * ncol) + col
            SUB     W11, W11, 1
            B       loopC


/* Subroutine that makes the operation 'P'
    Format: 'P', col, lin, n
    Changes the value in (col, line) to n
*/
P:          MOV     X14, 0
            LDRB    W9, [X2], 1                 // W9 -> col
            LDRB    W10, [X2], 1                // W10 -> lin
            LDRB    W13, [X2], 1                // W13 -> n
            UMULL   X14, W10, W0                // lin * ncol
            ADD     X14, X14, W9, sxtw          // lin * ncol + col
            STRB    W13, [X3, X14]
            B       loop


/* Subroutine that makes the operation 'B'
    [0, 127] -> 0
    Others   -> 255
*/
B:          //ADD   X2, X2, 1
            SMULL   X10, W0, W1
            MOV     X13, 0                      // offset
            MOV     W9, 0
            MOV     W11, 255

loopB:      CBZ     X10, loop
            LDRB    W14, [X12, X13]
            CMP     W14, 127
            SUB     X10, X10, 1                 // decrement 'iterations left' counter
            B.LE    lower                       // if (W14 <= 127)
            STRB    W11, [X12, X13]             // if (W14 > 127)
            ADD     X13, X13, 1
            B       loopB

lower:      STRB    W9, [X12, X13]
            ADD     X13, X13, 1
            B       loopB


/////////////////////// TO BE GIVEN ///////////////////////
// Subroutine that makes the operation 'O'
ocorr:      MOV     W9, 0

loop2:      LDRB    W4, [X1], 1
            CBZ     W2, end2
            CMP     W0, W4
            CINC    W9,W9, EQ
            SUB     W2, W2, 1
            B       loop2

end2:       MOV     W0, W9
            RET
