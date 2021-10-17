.text
.global NCAP
.type NCAP, "function"

// C prototype: int NCAP(int n);
NCAP:   RBIT    W1, W0
        CMP     W0, W1
        CSET    W0, EQ
        RET