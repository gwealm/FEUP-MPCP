.text
.global POS1msb
.type POS1msb, "function"

// C prototype: int POS1msb(long int n);
POS1msb:    CLZ     X1, X0
            MOV     X2, #63
            SUB     X0, X2, X1
            RET