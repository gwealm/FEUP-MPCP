.text
.global incsatV
.type incsatV, "function"

// X0 - pointer to the first array (int array)
// W1 - size of the array
// W2 - element to be addded
incsatV:    LSR     W1, W1, #2

loop:       CBZ     W1, end
            LDR     Q0, [X0]
            DUP     V1.4S, W2
            SQADD   V2.4S, V0.4S, V1.4S
            STR     Q2, [X0], #16
            SUB     W1, W1, #1
            B       loop

end:        RET