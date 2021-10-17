.text
.global mirrorSeq
.type mirrorSeq, "function"


// X0 - pointer to the first array (float array)
// W1 - size of the array
mirrorSeq:  LSR     W1, W1, #2

loop:       CBZ     W1, end
            LDR     Q0, [X0]
            REV64   V0.4S, V0.4S
            STR     Q0, [X0], #16
            SUB     W1, W1, #1
            B       loop

end:        RET