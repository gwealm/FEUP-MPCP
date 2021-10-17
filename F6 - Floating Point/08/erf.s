.data
.global a1, a2, a3, a4
a1:	.double 0.278393
a2:	.double 0.230389
a3:	.double 0.000972
a4:	.double 0.078108

.text
.global erfpos
.type erfpos, "function"

// D0 - x value
erfpos:     LDR     D1, a1              // D1 = 0.278393
            LDR     D2, a2              // D2 = 0.230389
            LDR     D3, a3              // D3 = 0.000972
            LDR     D4, a4              // D4 = 0.078108
            MOV     X1, #1
            SCVTF   D7, X1              // D7 = 1.0
            FMOV    D5, D0              // D5 = x
            FMUL    D6, D0, D1          // D6 = a1*x
            FMUL    D0, D0, D0          // D0 = x^2
            FMADD   D6, D0, D2, D6      // D6 = a1*x + a2*x^2
            FMUL    D0, D0, D5          // D0 = x^3
            FMADD   D6, D0, D3, D6      // D6 = a1*x + a2*x^2 + a3*x^3
            FMUL    D0, D0, D5          // D0 = x^4
            FMADD   D6, D0, D4, D6      // D6 = a1*x + a2*x^2 + a3*x^3 + a4*x^4
            FADD    D6, D6, D7          // D6 = 1 + a1*x + a2*x^2 + a3*x^3 + a4*x^4
            FMUL    D6, D6, D6
            FMUL    D0, D6, D6          // D0 = (1 + a1*x + a2*x^2 + a3*x^3 + a4*x^4)^4
            FDIV    D0, D7, D0          // D0 = 1 / (1 + a1*x + a2*x^2 + a3*x^3 + a4*x^4)^4
            FSUB    D0, D7, D0          // D0 = 1 - (1 / (1 + a1*x + a2*x^2 + a3*x^3 + a4*x^4)^4)
            RET