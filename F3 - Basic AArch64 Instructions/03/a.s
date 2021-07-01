.text
.global a
.type a, "function"

a:  		MOV		X2, #11
			MOV		X7, #0

loop:		CMP		X2, #101
			ADD		X7, X7, X2
			B.EQ	end
			ADD		X2, X2, #10
			B		loop

end:		RET
