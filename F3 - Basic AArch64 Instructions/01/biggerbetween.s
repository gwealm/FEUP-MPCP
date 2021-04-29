.text
.global biggerbetween
.type biggerbetween, "function"

biggerbetween:		MOV X9, X11			// Puts X11 in X9
			CMP X10, X11
			B.LT final
			MOV X9, X10
final: 			RET				// At this phase, X9 will contain the biggest value between X10 and X11
