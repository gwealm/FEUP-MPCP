.text
.global b
.type b, "function"

// X0 - address to the beggining of the first sequence
// W1 - length of the sequence
// X2 - address to the beggining of the second sequence
b:      CBZ     W1, end
        LDRSW   X3, [X0], #4
        STR     X3, [X2], #8
        SUB     W1, W1, #1
        B       b

end:    RET