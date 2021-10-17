.text
.global c
.type c, "function"

c:      UBFX    W13, W14, #3, #29
        LSR     W14, W14, #29
        BFI     W13, W14, #28, #3
        RET