/ ======= prog.c =======
    extern long int POLI(long int x);
    int main(void) {
    long int r;
    ...
    r = POLI(7);
    printf("Resultado = %d\n", r);
    return EXIT_SUCCESS;
}

// ======= subrot.s =======
POLI:   STP     X29, X30, [SP, #-32]!
        MOV     X29, SP
        STR     X20, [SP, #24]
        MOV     X10, X0     // <1>
        BL      QUAD
        MOV     X20, X0
        MOV     X0, #3
        MUL     X10, X10, X0
        ADD     X0, X20, X10
        ADD     X0, X0, #1
        MOV     X29, SP
        LDP     X20, [SP, #24]
        STP     X29, X30, [SP], #32
        RET                 // <2>
        QUAD:   MUL X0, X0, X0
        RET


/*
 * a) X0^2 + 3*X0 + 1
 * 7^2 + 3*7 + 1 = 71
 * R: Resultado = 71
 *
 * c) antes de <1> a stack terá o valor de LR (X30), o qual aponta para a função main(), o valor do frame pointer (X29) e o valor inicial de X20
 * 
 * antes de <2> a stack terá o valor de LR (X30), o qual aponta para a instrução após a invocação da subrotina QUAD, o valor do frame pointer (X29) e o valor inicial de X20
 */