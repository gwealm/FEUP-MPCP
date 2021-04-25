.text
.global comparehalfs
.type comparehalfs, "function"

comparehalfs:		MOV X7, 1
			UBFX X1, X0, 32 , 32
			UXTW X2, W0
			CMP X1, X2
			B.EQ end
			MOV X7, 0

end:			RET
