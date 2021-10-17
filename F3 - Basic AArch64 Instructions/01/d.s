.text
.global comparehalfs
.type comparehalfs, "function"

comparehalfs:   MOV     W1, W0
                LSR     X0, X0, #32
                CMP     W0, W1
                CSET    X7, EQ
                RET


/* solution 2
comparehalfs:   UBFX    X1, X0, #32, #32
                CMP     W0, W1
                CSET    W7, EQ
                RET
*/
