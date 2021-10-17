.text
.global conta_ocorr
.type conta_ocorr, "function"


// X0 - pointer to the first array (char array)
// X1 - size of the array
// W2 - char to be found
conta_ocorr:    MOV     X3, #0          // X3 - stores the result
                LSR     X1, X1, #4

loop:           CBZ     X1, end
                LDR     Q0, [X0], #16
                DUP     V1.16B, W2
                CMEQ    V2.16B, V0.16B, V1.16B
                ABS     V2.16B, V2.16B
                ADDV    B3, V2.16B
                UMOV    W4, V3.B[0]
                ADD     X3, X3, W4, sxtw
                SUB     X1, X1, #1
                B       loop

end:            MOV     X0, X3
                RET
