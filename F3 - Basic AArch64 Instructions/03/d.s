.text
.global count_ones
.type count_ones, "function"

count_ones:		MOV		X7, 0
				EON		X0, X0, X1

count_ones:		CBZ		X0, end
				AND		X6, X0, #1
				ADD		X7, X7, X6
				LSR		X0, X0, #1
				B		count_ones

end:			RET
