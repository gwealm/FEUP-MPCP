.text
.global PAL8
.type PAL8, "function"

// C prototype: int PAL8(char *s);
PAL8:   LDR     X2, [X1]
        REV     X3, X2
        CMP     X2, X3
        CSET    X0, EQ
        RET