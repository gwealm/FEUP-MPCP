.text
.global biggerbetween
.type biggerbetween, "function"

biggerbetween:  CMP    X10, X11
                CSEL   X9, X10, X11, GT
                RET