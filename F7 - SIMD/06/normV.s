.text
.global normV
.type normV, "function"


// X0 - pointer to the first array (double array)
// X1 - size of the array
normV:      LSR     X1, X1, #1
            SUB     D3, D3, D3		// stores the result

loop:       CBZ     X1, end
            LDR     Q0, [X0], #16
            FMUL    V1.2D, V0.2D, V0.2D
            FADDP   D2, V1.2D
            FADD    D3, D3, D2
            SUB     X1, X1, #1
            B       loop

end:        FSQRT   D0, D3
            RET